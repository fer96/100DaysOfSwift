//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Fernando De La Rosa on 12/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
	var image: String
	
	var body: some View {
		Image(image)
			.renderingMode(.original)
			.clipShape(Capsule())
			.overlay(Capsule().stroke(Color.black, lineWidth: 1))
			.shadow(color: .black, radius: 2.0)
	}
}

struct ContentView: View {
	@State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
	@State private var correctAnswer = Int.random(in: 0...2)
	@State private var showingScore = false
	@State private var scoreTitle = ""
	@State private var totalScore = 0
	
	var body: some View {
		ZStack {
			LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
			
			HStack {
				VStack(spacing: 30) {
						VStack{
							Text("Tap the flag of").foregroundColor(.white)
							Text(countries[correctAnswer])
								.foregroundColor(.white)
								.font(.largeTitle)
								.fontWeight(.black)
						}
						
						ForEach(0 ..< 3) { number in
							Button(action: {
								self.flagTap(number)
							}) {
								FlagImage(image: self.countries[number])
							}
						}
						
						Text("Score: \(totalScore)").foregroundColor(.white)
						Spacer()
					}
				}
				.alert(isPresented: $showingScore) { () -> Alert in
					Alert(title: Text(scoreTitle), message: Text("Your score is: \(totalScore)"), dismissButton: .default(Text("Continue"), action: self.askQuestion))
			}
		}
	}
	
	func flagTap(_ number: Int) {
		if number == correctAnswer {
			scoreTitle = "Correct"
			totalScore += 1
		} else {
			scoreTitle = "Wrong! This flag is from \(countries[number])"
		}
		
		showingScore = true
	}
	
	func askQuestion() {
		countries = countries.shuffled()
		correctAnswer = Int.random(in: 0...2)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
			ContentView()
	}
}
