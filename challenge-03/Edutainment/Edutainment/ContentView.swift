//
//  ContentView.swift
//  Edutainment
//
//  Created by Fernando De La Rosa on 26/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//
/*
Show the player how many questions they got correct at the end of the game, then offer to let them play again.
*/

import SwiftUI

// MARK: - Entity
struct Question {
	var result: Int
	var base: Int
	var times: Int
	
	init(base: Int, times: Int) {
		self.base = base
		self.times = times
		
		self.result = base * times
	}
}

struct Game {
	var numberOfQuestions: Int
	var base: Int
	var questions: [Question] = [Question]()
	
	init(base: Int = 0, numberOfQuestions: Int = 0) {
		self.base = base
		self.numberOfQuestions = numberOfQuestions
		
		for _ in 0 ..< numberOfQuestions {
			let random = Int.random(in: 1...100)
			let question = Question(base: base, times: random)
			
			self.questions.append(question)
		}
		
		self.questions.shuffle()
	}
}

enum GameState: String {
	case start = "Start Game"
	case next = "Next question"
	case end = "End Game"
}

// MARK: - View
struct ContentView: View {
	@State private var baseNumber: Int = 1
	@State private var numberOfQuestionsSelected: Int = 0
	@State private var answer: Int = 0
	@State private var stateGame: GameState = .start
	@State private var currentTime: Int = 0
	@State private var nextQuestion: Int = 0
	
	let staticQuestions: [Int] = [5, 10, 20, 30]
	
	var game: Game {
		return Game(base: baseNumber, numberOfQuestions: currentNumberOfQuestions)
	}
	
	var currentAnswers: [Int] {
		return generator()
	}
	
	var currentNumberOfQuestions: Int {
		staticQuestions[numberOfQuestionsSelected]
	}
}

extension ContentView {
	var body: some View {
		NavigationView {
			VStack(spacing: 30.0) {
				Form {
					/// Input base number
					Section(header: Text("What multiplication table do you want to learn?")) {
						Stepper("\(baseNumber)", value: $baseNumber, in: 1...15)
					}
					
					/// Input number of questions
					Section(header: Text("How many questions do you want?")) {
						Picker(selection: $numberOfQuestionsSelected, label: Text("Questions")) {
							ForEach(0 ..< staticQuestions.count) {
								Text("\(self.staticQuestions[$0])")
							}
						}
						.labelsHidden()
						.pickerStyle(SegmentedPickerStyle())
					}
				}
				
				Form {
					/// Input answer
					Section(header: Text("Select the correct answer of \(baseNumber) by \(currentTime)")) {
						Picker(selection: $answer, label: Text("Answer")) {
							ForEach(0 ..< currentAnswers.count) {
								Text("\(self.currentAnswers[$0])")
							}
						}
						.labelsHidden()
						.pickerStyle(SegmentedPickerStyle())
					}
				}
				
				/// Start game
				Button("\(stateGame.rawValue)", action: mainButton)
				.font(.largeTitle)
				.foregroundColor(.white)
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50.0)
				.background(colorButton())
				.cornerRadius(50.0)
				
				Spacer()
			}
			/// Title
			.navigationBarTitle("Edutainment App")
		}
	}
}

// MARK: - Logic
extension ContentView {
	func mainButton() {
		switch stateGame {
		case .start:
			stateGame = .next
			currentTime = game.questions[nextQuestion].times
			nextQuestion += 1
		case .next:
			if nextQuestion < currentNumberOfQuestions {
				currentTime = game.questions[nextQuestion].times
			} else {
				stateGame = .end
			}
			nextQuestion += 1
		case .end:
			stateGame = .start
		}
	}
	
	func generator() -> [Int] {
		var answers: [Int] = [Int]()
		
		for _ in 0 ..< 4 {
			let random = Int.random(in: 1...100)
			answers.append(random)
		}
		
		answers.append(game.questions[nextQuestion].result)
		answers.shuffle()
		
		return answers
	}
	
	func colorButton() -> Color {
		switch stateGame {
		case .start:
			return Color.green
		case .next:
			return Color.blue
		case .end:
			return Color.red
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
