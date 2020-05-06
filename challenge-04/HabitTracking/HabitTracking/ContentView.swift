//
//  ContentView.swift
//  HabitTracking
//
//  Created by Fernando De La Rosa on 06/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var items: Item {
		didSet {
			let decoder = JSONDecoder()
			if let data = UserDefaults.standard.object(forKey: "Items") as? Data {
				if let itemObject = try? decoder.decode(Item.self, from: data) {
					items = itemObject
				}
			}
		}
	}
	@State private var presentFormHabit = false
	
	var body: some View {
		NavigationView {
			/// List of habits
			List {
				ForEach(items.habits) { habit in
					VStack {
						NavigationLink(destination: HabitView(habit: habit)) {
							Text(habit.name)
							Text(habit.description).font(.footnote)
						}
					}
				}
			}

			/// Navigation title
				.navigationBarTitle(Text("Tracking habits"))
			
			/// Add habit button
			.navigationBarItems(leading:
				Button("Save") {
					let encoder = JSONEncoder()
					if let data = try? encoder.encode(self.items) {
						UserDefaults.standard.set(data, forKey: "Items")
					}
			}, trailing:
				Button("Add") {
					self.presentFormHabit = true
			})
			
			/// Present form habit
			.sheet(isPresented: $presentFormHabit) {
				FormHabit(items: self.items)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(items: Item())
	}
}
