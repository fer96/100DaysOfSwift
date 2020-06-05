//
//  ContentView.swift
//  HotProspects
//
//  Created by Fernando De La Rosa on 02/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Porperties
struct ContentView: View {
	var prospects = Prospects()
}

// MARK: - Logic
extension ContentView {}

// MARK: - View
extension ContentView {
	var body: some View {
		TabView {
			ProspectsView(filter: .none)
				.tabItem {
					Image(systemName: "person.3")
					Text("Everyone")
			}
			ProspectsView(filter: .contacted)
				.tabItem {
					Image(systemName: "checkmark.circle")
					Text("Contacted")
			}
			ProspectsView(filter: .uncontacted)
				.tabItem {
					Image(systemName: "questionmark.diamond")
					Text("Uncontacted")
			}
			MeView()
				.tabItem {
					Image(systemName: "person.crop.square")
					Text("Me")
			}
		}.environmentObject(prospects)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
