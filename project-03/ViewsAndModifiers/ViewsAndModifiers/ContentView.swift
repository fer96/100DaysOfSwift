//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Fernando De La Rosa on 16/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct BlueTitle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.blue)
	}
}

struct ContentView: View {
    var body: some View {
			Text("Hello, World!").titleBlue()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: - Extension Views
extension View {
	func titleBlue() -> some View {
		self.modifier(BlueTitle())
	}
}
