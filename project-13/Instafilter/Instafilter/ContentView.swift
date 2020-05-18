//
//  ContentView.swift
//  Instafilter
//
//  Created by Fernando De La Rosa on 18/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var showingActionSheet = false
	@State private var backgroundColor = Color.white
	
	var body: some View {
		Text("Hello, World!")
			.frame(width: 300, height: 300)
			.background(backgroundColor)
			.onTapGesture {
				self.showingActionSheet = true
		}
			/// ALERT
			.actionSheet(isPresented: $showingActionSheet) {
				ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
					.default(Text("Red")) { self.backgroundColor = .red },
					.default(Text("Green")) { self.backgroundColor = .green },
					.default(Text("Blue")) { self.backgroundColor = .blue },
					.cancel()
				])
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
