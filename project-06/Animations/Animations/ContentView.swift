//
//  ContentView.swift
//  Animations
//
//  Created by Fernando De La Rosa on 23/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct CornerRotateModifier: ViewModifier {
	let amount: Double
	let anchor: UnitPoint

	func body(content: Content) -> some View {
		content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
	}
}

extension AnyTransition {
	static var pivot: AnyTransition {
		.modifier(
			active: CornerRotateModifier(amount: -90, anchor: .topLeading),
			identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
		)
	}
}

struct ContentView: View {
	@State private var isShowingRed = false
}

// MARK: - View
extension ContentView {
	var body: some View {
		VStack {
			Button("Tap Me") {
				withAnimation {
					self.isShowingRed.toggle()
				}
			}
			
			if isShowingRed {
				Rectangle()
					.fill(Color.red)
					.frame(width: 200, height: 200)
					.transition(.pivot)
			}
			
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
