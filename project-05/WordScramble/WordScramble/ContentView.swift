//
//  ContentView.swift
//  WordScramble
//
//  Created by Fernando De La Rosa on 21/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var usedWords = [String]()
	@State private var rootWord = ""
	@State private var newWord = ""
	@State private var errorTitle = ""
	@State private var errorMessage = ""
	@State private var showingError = false
}

// MARK: - View
extension ContentView {
	var body: some View {
		NavigationView {
			VStack {
				TextField("Enter your word", text: $newWord, onCommit: addNewWord)
					.textFieldStyle(RoundedBorderTextFieldStyle())
					.padding()
					.autocapitalization(.none)
				
				List(usedWords, id: \.self) {
					Image(systemName: "\($0.count).circle")
					Text($0)
				}
			}
			/// Title
				.navigationBarTitle(rootWord)
				.onAppear(perform: startGame)
			
			/// Alert
				.alert(isPresented: $showingError) { () -> Alert in
					Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Ok")))
			}
		}
	}
}

// MARK: - Logic
extension ContentView {
	func addNewWord() {
		let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		guard !answer.isEmpty else {
			return
		}
		guard isOriginal(word: answer) else {
			wordError(title: "Word used already", message: "Be more original")
			return
		}
		guard isPossible(word: answer) else {
			wordError(title: "Word not recognized", message: "You can't just make them up")
			return
		}
		guard isReal(word: answer) else {
			wordError(title: "Word not possible", message: "That isn't a real word")
			return
		}
		
		usedWords.insert(answer, at: 0)
		newWord = ""
	}
	
	func startGame() {
		if let starWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
			let startWords = try? String(contentsOf: starWordsURL) {
			
			let allWords = startWords.components(separatedBy: "\n")
			rootWord = allWords.randomElement() ?? "silkworm"
			return
		}
		
		fatalError("Could not load start.txt from bundle")
	}
	
	func isOriginal(word: String) -> Bool {
		!usedWords.contains(word)
	}
	
	func isPossible(word: String) -> Bool {
		var tempWord = rootWord
		
		for letter in word {
			if let pos = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: pos)
			} else {
				return false
			}
		}
		
		return true
	}
	
	func isReal(word: String) -> Bool {
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		
		return misspelledRange.location == NSNotFound
	}
	
	func wordError(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showingError = true
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
