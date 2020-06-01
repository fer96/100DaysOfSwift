//
//  ContentView.swift
//  Meetup
//
//  Created by Fernando De La Rosa on 01/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct ContentView: View {
	let images = ["a", "b", "c"]
}

// MARK: - Logic
extension ContentView {}

// MARK: - View
extension ContentView {
	var body: some View {
		NavigationView {
			Form {
				ForEach(images, id: \.self) { image in
					HStack {
						/// Image
						Text(image)
					}
				}
			}
			
			/// Add button
				.navigationBarItems(trailing:
					Button("Add") {
						/// More code here
				})
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
