//
//  ViewController.swift
//  WordScramble-UIKit
//
//  Created by Fernando De La Rosa on 04/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	
	// MARK: - Properties
	var allWords = [String]()
	var usedWords = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupData()
		setupView()
		startGame()
	}

	// MARK: - Private methods
	private func setupData() {
		if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
			let startWords = try? String(contentsOf: startWordsURL) {
				allWords = startWords.components(separatedBy: "\n")
		}
		
		if allWords.isEmpty {
			allWords = ["silkworm"]
		}
	}
	
	@objc private func startGame() {
		title = allWords.randomElement()
		usedWords.removeAll(keepingCapacity: true)
		tableView.reloadData()
	}
	
	private func setupView() {
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .redo, target: self, action: #selector(startGame))
	}
	
	private func submit(_ answer: String) {
		let lowerAnswer = answer.lowercased()
		
		let errorTitle: String
		let errorMessage: String
		
		if isPossible(word: lowerAnswer) {
			if isOriginal(word: lowerAnswer) {
				if isReal(word: lowerAnswer) {
					usedWords.insert(answer, at: 0)
					
					let indexPath = IndexPath(row: 0, section: 0)
					tableView.insertRows(at: [indexPath], with: .automatic)
					
					return
				} else {
					errorTitle = "Word not recognised"
					errorMessage = "You can't just make them up, you know!"
				}
			} else {
				errorTitle = "Word used already"
				errorMessage = "Be more original!"
			}
		} else {
			guard let title = title?.lowercased() else { return }
			errorTitle = "Word not possible"
			errorMessage = "You can't spell that word from \(title)"
		}
		
		presentAlertError(title: errorTitle, message: errorMessage)
	}
	
	private func isPossible(word: String) -> Bool {
		guard var tempWord = title?.lowercased(), tempWord != word else { return false }
		
		for letter in word {
			if let position = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: position)
			} else {
				return false
			}
		}
		
		return true
	}
	
	private func isOriginal(word: String) -> Bool {
		!usedWords.contains(word)
	}
	
	private func isReal(word: String) -> Bool {
		guard word.count > 3 else { return false }
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		
		return misspelledRange.location == NSNotFound
	}
	
	private func presentAlertError(title: String, message: String) {
		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
	
	@objc private func promptForAnswer() {
    let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
    ac.addTextField()

		let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
			guard let answer = ac?.textFields?[0].text else { return }
			self?.submit(answer)
		}

    ac.addAction(submitAction)
    present(ac, animated: true)
	}
}

// MARK: - Table View
extension ViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return usedWords.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
		cell.textLabel?.text = usedWords[indexPath.row]
		return cell
	}
}
