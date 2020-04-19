//
//  ContentView.swift
//  RockPapperScissors
//
//  Created by Fernando De La Rosa on 18/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

enum Option: String {
	case rock = "👊🏽"
	case papper = "✋🏽"
	case scissors = "✌🏽"
}

struct ContentView: View {
	@State private var options: [Option] = [.rock, .papper, .scissors].shuffled()
	@State private var userOption: Option = .rock
	@State private var gameOption: Option = .rock
	@State private var scoreTitle = ""
	@State private var totalScore = 0
	@State private var showingScore = false
	@State private var endGame = false
	@State private var numberOfPlays: Int = 0
	
	var body: some View {
		ZStack {
			/// Backgraound gradient
			LinearGradient(gradient: Gradient(colors: [.green, .gray]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
			
			VStack(spacing: 30) {
				/// Title
				Text("Rock - Paper - Scissors").foregroundColor(.white).font(.largeTitle)
				
				/// Buttons
				ForEach(options, id: \.self) { option in
					Button(action: {
						if !self.endGame {
							self.play(option)
						}
					}) {
						Text("\(option.rawValue)")
					}
				}
				
				/// Result
					.alert(isPresented: $showingScore) { () -> Alert in
						let nextGame = Alert(title: Text("\(scoreTitle)"), dismissButton: .default(Text("Next round?"), action: self.nextRound))
						let restartGame = Alert(title: Text("Your final score is: \(totalScore)"), dismissButton: .default(Text("Want to play again?"), action: self.restartGame))
						
						if endGame {
							return restartGame
						} else {
							return nextGame
						}
				}
			}
		}
	}
	
	private func play(_ user: Option) {
		numberOfPlays += 1
		
		if user == gameOption {
			scoreTitle = "You win!"
			totalScore += 1
		} else {
			scoreTitle = "You loose!"
			if totalScore > 0 {
				totalScore -= 1
			}
		}
		
		showingScore = true
		
		if numberOfPlays == 10 {
			endGame = true
		}
	}
		
	func nextRound() {
		options.shuffle()
		guard let nextOption = options.randomElement() else {
			return
		}
		gameOption = nextOption
	}
	
	func restartGame() {
		options.shuffle()
		scoreTitle = ""
		totalScore = 0
		showingScore = false
		endGame = false
		numberOfPlays = 0
	}
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
		ContentView()
	}
}
