//
//  ViewController.swift
//  GuessTheFlag-UIKit
//
//  Created by Fernando De La Rosa on 27/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Outlets
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var button3: UIButton!
	
	// MARK: - Properties
	var countries = [String]()
	var score = 0
	var correctAnswer = 0
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		loadCountries()
		askQuestion()
	}
	
	// MARK: - Setup view
	private func setupView() {
		button1.layer.borderWidth = 1
		button2.layer.borderWidth = 1
		button3.layer.borderWidth = 1
		
		button1.layer.borderColor = UIColor.lightGray.cgColor
		button2.layer.borderColor = UIColor.lightGray.cgColor
		button3.layer.borderColor = UIColor.lightGray.cgColor
	}
	
	// MARK: - Logic
	private func loadCountries() {
		countries.append("estonia")
		countries.append("france")
		countries.append("germany")
		countries.append("ireland")
		countries.append("italy")
		countries.append("monaco")
		countries.append("nigeria")
		countries.append("poland")
		countries.append("russia")
		countries.append("spain")
		countries.append("uk")
		countries.append("us")
	}
	
	private func askQuestion(action: UIAlertAction! = nil) {
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
		title = countries[correctAnswer].uppercased()
		
		button1.setImage(UIImage(named: countries[0]), for: .normal)
		button2.setImage(UIImage(named: countries[1]), for: .normal)
		button3.setImage(UIImage(named: countries[2]), for: .normal)
	}
	
	// MARK: IBActions
	@IBAction func buttonTapped(_ sender: UIButton) {
		var title: String
		
		if sender.tag == correctAnswer {
			title = "Correct"
			score += 1
		} else {
			title = "Wrong"
			score -= 1
		}
		
		let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
		present(ac, animated: true)
	}
}

