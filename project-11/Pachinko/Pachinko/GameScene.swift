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
	
	// MARK: - Game methods
	override func didMove(to view: SKView) {
		setupBackground()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		if let touch = touches.first {
			let location = touch.location(in: self)
			let ball = SKSpriteNode(imageNamed: "ballRed")
			ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
			ball.physicsBody?.restitution = 0.4
			ball.position = location
			addChild(ball)
			
			physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
			
			makeBouncer(at: CGPoint(x: 0, y: 0))
			makeBouncer(at: CGPoint(x: 256, y: 0))
			makeBouncer(at: CGPoint(x: 512, y: 0))
			makeBouncer(at: CGPoint(x: 768, y: 0))
			makeBouncer(at: CGPoint(x: 1024, y: 0))
		}
	}
	
	// MARK: - Setup view
	private func setupBackground() {
		let background = SKSpriteNode(imageNamed: "background.jpg")
		background.position = CGPoint(x: 512, y: 384)
		background.blendMode = .replace
		background.zPosition = -1
		addChild(background)
	}
	
	// MARK: - Private methods
	private func makeBouncer(at position: CGPoint) {
		let bouncer = SKSpriteNode(imageNamed: "bouncer")
		bouncer.position = position
		bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
		bouncer.physicsBody?.isDynamic = false
		addChild(bouncer)
	}
}
