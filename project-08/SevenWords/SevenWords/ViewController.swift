//
//  ViewController.swift
//  SevenWords
//
//  Created by Fernando De La Rosa on 19/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	// MARK: - Proeprties
	var cluesLabel: UILabel!
	var answersLabel: UILabel!
	var currentAnswer: UITextField!
	var scoreLabel: UILabel!
	var letterButtons = [UIButton]()
	var activatedButtons = [UIButton]()
	
	var solutions = [String]()
	var level = 1
	var score = 0 {
		didSet {
			scoreLabel.text = "Score: \(score)"
		}
	}

	// MARK: - Life cycle
	override func loadView() {
		
		setupView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loadLevel()
	}
	
	// MARK: - Setup View
	private func setupView() {
		view = UIView()
		view.backgroundColor = .white
		
		setupScoreLabel()
		setupGameLabels()
		setupAnswerTextfields()
		setupGameButtons()
	}
	
	private func setupScoreLabel() {
		// Create label
		scoreLabel = UILabel()
		scoreLabel.translatesAutoresizingMaskIntoConstraints = false
		scoreLabel.textAlignment = .right
		scoreLabel.text = "Score: 0"
		view.addSubview(scoreLabel)
		// Config constaint label
		NSLayoutConstraint.activate([
			scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
			scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
		])
	}
	
	private func setupGameLabels() {
		// Create labels
		cluesLabel = UILabel()
		cluesLabel.translatesAutoresizingMaskIntoConstraints = false
		cluesLabel.font = UIFont.systemFont(ofSize: 24)
		cluesLabel.text = "CLUES"
		cluesLabel.numberOfLines = 0
		view.addSubview(cluesLabel)
		
		answersLabel = UILabel()
		answersLabel.translatesAutoresizingMaskIntoConstraints = false
		answersLabel.font = UIFont.systemFont(ofSize: 24)
		answersLabel.text = "ANSWERS"
		answersLabel.numberOfLines = 0
		answersLabel.textAlignment = .right
		view.addSubview(answersLabel)
		
		cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
		answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
		
		// Config constraints label
		NSLayoutConstraint.activate([
			cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
			cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
			cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
			answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
			answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
			answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
			answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor)
		])
	}
	
	private func setupAnswerTextfields() {
		// Create text fields answers
		currentAnswer = UITextField()
		currentAnswer.translatesAutoresizingMaskIntoConstraints = false
		currentAnswer.placeholder = "Tap letters to guess"
		currentAnswer.textAlignment = .center
		currentAnswer.font = UIFont.systemFont(ofSize: 44)
		currentAnswer.isUserInteractionEnabled = false
		view.addSubview(currentAnswer)
		// Config constratins text fields answers
		NSLayoutConstraint.activate([
			currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
			currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20)
		])
	}
	
	private func setupGameButtons() {
		// Create Buttons
		let submit = UIButton(type: .system)
		submit.translatesAutoresizingMaskIntoConstraints = false
		submit.setTitle("SUBMIT", for: .normal)
		submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
		view.addSubview(submit)
		
		let clear = UIButton(type: .system)
		clear.translatesAutoresizingMaskIntoConstraints = false
		clear.setTitle("CLEAR", for: .normal)
		clear.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
		view.addSubview(clear)
		
		let buttonsView = UIView()
		buttonsView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(buttonsView)
		
		// Config constraints buttons
		NSLayoutConstraint.activate([
			submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
			submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
			submit.heightAnchor.constraint(equalToConstant: 44),
			
			clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
			clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
			clear.heightAnchor.constraint(equalToConstant: 44),
			
			buttonsView.widthAnchor.constraint(equalToConstant: 750),
			buttonsView.heightAnchor.constraint(equalToConstant: 320),
			buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
			buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
		])
		
		// Create grid of buttons
		let width = 150
		let height = 80
		
		for row in 0..<4 {
			for col in 0..<5 {
				let letterButton = UIButton(type: .system)
				letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
				letterButton.setTitle("WWW", for: .normal)
				letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
				let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
				letterButton.frame = frame
				buttonsView.addSubview(letterButton)
				letterButtons.append(letterButton)
			}
		}
	}
	
	// MARK: - Logic
	@objc func letterTapped(_ sender: UIButton) {
		guard let buttonTitle = sender.titleLabel?.text else { return }
		currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
		activatedButtons.append(sender)
		sender.isHidden = true
	}
	
	@objc func submitTapped(_ sender: UIButton) {
		guard let answerText = currentAnswer.text else { return }
		
		if let solutionPosition = solutions.firstIndex(of: answerText) {
			activatedButtons.removeAll()
			
			var splitAnswers = answersLabel.text?.components(separatedBy: "\n")
			splitAnswers?[solutionPosition] = answerText
			answersLabel.text = splitAnswers?.joined(separator: "\n")
			
			currentAnswer.text = ""
			score += 1
			
			if score % 7 == 0 {
				let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
				ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
				present(ac, animated: true)
			}
		}
	}
	
	@objc func clearTapped(_ sender: UIButton) {
		currentAnswer.text = ""
		for btn in activatedButtons {
			btn.isHidden = false
		}
		activatedButtons.removeAll()
	}
	
	private func loadLevel() {
		var clueString = ""
		var solutionString = ""
		var letterBits = [String]()
		
		if let levelFileURL = Bundle.main.url(forResource: "level\(level)", withExtension: "txt") {
			if let levelContents = try? String(contentsOf: levelFileURL) {
				var lines = levelContents.components(separatedBy: "\n")
				lines.shuffle()
				
				for (index, line) in lines.enumerated() {
					let parts = line.components(separatedBy: ": ")
					let answer = parts[0]
					let clue = parts[1]
					
					clueString += "\(index + 1). \(clue)\n"
					
					let solutionWord = answer.replacingOccurrences(of: "|", with: "")
					solutionString += "\(solutionWord.count) letters\n"
					solutions.append(solutionWord)
					
					let bits = answer.components(separatedBy: "|")
					letterBits += bits
				}
			}
		}
		
		cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
		answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
		
		letterBits.shuffle()
		
		if letterBits.count == letterButtons.count {
			for i in 0 ..< letterButtons.count {
				letterButtons[i].setTitle(letterBits[i], for: .normal)
			}
		}
	}
	
	private func levelUp(action: UIAlertAction) {
		level += 1
		solutions.removeAll(keepingCapacity: true)
		
		loadLevel()
		
		for btn in letterButtons {
			btn.isHidden = false
		}
	}
}

