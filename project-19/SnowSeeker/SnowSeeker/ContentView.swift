//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Fernando De La Rosa on 19/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct UserView: View {
	var body: some View {
		Group {
			Text("Name: Paul")
			Text("Country: England")
			Text("Pets: Luna, Arya, and Toby")
		}
	}
}

struct ContentView: View {
	@Environment(\.horizontalSizeClass) var sizeClass
	
	var body: some View {
		Group {
			if sizeClass == .compact {
				VStack(content: UserView.init)
			} else {
				HStack(content: UserView.init)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
