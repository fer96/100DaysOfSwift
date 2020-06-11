//
//  ContentView.swift
//  Flashzilla
//
//  Created by Fernando De La Rosa on 09/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct ContentView: View {
	@State private var cards = [Card](repeating: Card.example, count: 10)
}

// MARK: - Logic
extension ContentView {
	func removeCard(at index: Int) {
		cards.remove(at: index)
	}
}

// MARK: - View
extension ContentView {
	var body: some View {
		ZStack {
			Image("background")
				.resizable()
				.scaledToFill()
				.edgesIgnoringSafeArea(.all)
			VStack {
				ZStack {
					ForEach(0..<cards.count, id: \.self) { index in
						CardView(card: self.cards[index]) {
							withAnimation {
								self.removeCard(at: index)
							}
						}
						.stacked(at: index, in: self.cards.count)
					}
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

// MARK: - Stacked method
extension View {
	func stacked(at position: Int, in total: Int) -> some View {
		let offset = CGFloat(total - position)
		return self.offset(CGSize(width: 0, height: offset * 10))
	}
}
