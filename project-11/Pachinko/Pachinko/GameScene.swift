//
//  GameScene.swift
//  Pachinko
//
//  Created by Fernando De La Rosa on 02/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	// MARK: - Properties
	var scoreLabel: SKLabelNode!
	var editLabel: SKLabelNode!
	let balls = ["ballRed", "ballBlue", "ballCyan", "ballGreen", "ballPurple", "ballYellow"]
	
	var score = 0 {
		didSet {
			scoreLabel.text = "Score: \(score)"
		}
	}
	var editingMode: Bool = false {
		didSet {
			if editingMode {
				editLabel.text = "Done"
			} else {
				editLabel.text = "Edit"
			}
		}
	}
	
	// MARK: - Game methods
	override func didMove(to view: SKView) {
		setupView()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		if let touch = touches.first {
			let location = touch.location(in: self)
			let objects = nodes(at: location)
			
			if objects.contains(editLabel) {
				editingMode.toggle()
			} else {
				let ballName = balls.randomElement()!
				let ball = SKSpriteNode(imageNamed: ballName)
				if objects.contains(editLabel) {
					editingMode.toggle()
				} else {
					if editingMode {
						let size = CGSize(width: Int.random(in: 16...128), height: 16)
						let box = SKSpriteNode(color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1), size: size)
						box.zRotation = CGFloat.random(in: 0...3)
						box.position = location
						
						box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
						box.physicsBody?.isDynamic = false
						
						addChild(box)
					} else {
						ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
						ball.physicsBody?.restitution = 0.4
						ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
						ball.position = location
						ball.name = "ball"
						addChild(ball)
					}
				}
			}
		}
	}
	
	// MARK: - Setup view
	private func setupView() {
		setupBackground()
		physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
		physicsWorld.contactDelegate = self
		createSlots()
		createBouncers()
		createScoreLabel()
		createEditLabel()
	}
	
	private func setupBackground() {
		let background = SKSpriteNode(imageNamed: "background.jpg")
		background.position = CGPoint(x: 512, y: 384)
		background.blendMode = .replace
		background.zPosition = -1
		addChild(background)
	}
	
	private func createEditLabel() {
		editLabel = SKLabelNode(fontNamed: "Chalkduster")
		editLabel.text = "Edit"
		editLabel.position = CGPoint(x: 80, y: 700)
		addChild(editLabel)
	}
	
	// MARK: - Private methods
	private func createScoreLabel() {
		scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
		scoreLabel.text = "Score: 0"
		scoreLabel.horizontalAlignmentMode = .right
		scoreLabel.position = CGPoint(x: 980, y: 700)
		addChild(scoreLabel)
	}
	
	private func createBouncers() {
		makeBouncer(at: CGPoint(x: 0, y: 0))
		makeBouncer(at: CGPoint(x: 256, y: 0))
		makeBouncer(at: CGPoint(x: 512, y: 0))
		makeBouncer(at: CGPoint(x: 768, y: 0))
		makeBouncer(at: CGPoint(x: 1024, y: 0))
	}
	
	private func makeBouncer(at position: CGPoint) {
		let bouncer = SKSpriteNode(imageNamed: "bouncer")
		bouncer.position = position
		bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
		bouncer.physicsBody?.isDynamic = false
		addChild(bouncer)
	}
	
	private func createSlots() {
		makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
		makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
		makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
		makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
	}

	private func makeSlot(at position: CGPoint, isGood: Bool) {
		var slotBase: SKSpriteNode
		var slotGlow: SKSpriteNode
		
		if isGood {
			slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
			slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
			slotBase.name = "good"
		} else {
			slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
			slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
			slotBase.name = "bad"
		}
		
		slotBase.position = position
		slotGlow.position = position
		
		slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
		slotBase.physicsBody?.isDynamic = false
		
		addChild(slotBase)
		addChild(slotGlow)
		
		let spin = SKAction.rotate(byAngle: .pi, duration: 10)
		let spinForever = SKAction.repeatForever(spin)
		slotGlow.run(spinForever)
	}
	
	private func collisionBetween(ball: SKNode, object: SKNode) {
		if object.name == "good" {
			destroy(ball: ball)
			score += 1
		} else if object.name == "bad" {
			destroy(ball: ball)
			score -= 1
		}
	}
	
	private func destroy(ball: SKNode) {
		if let fireParticles = SKEmitterNode(fileNamed: "FireParticles") {
			fireParticles.position = ball.position
			addChild(fireParticles)
		}
		
		ball.removeFromParent()
	}
}

extension GameScene: SKPhysicsContactDelegate {
	func didBegin(_ contact: SKPhysicsContact) {
		guard let nodeA = contact.bodyA.node else { return }
		guard let nodeB = contact.bodyB.node else { return }
		
		if nodeA.name == "ball" {
			collisionBetween(ball: nodeA, object: nodeB)
		} else if nodeB.name == "ball" {
			collisionBetween(ball: nodeB, object: nodeA)
		}
	}
}
