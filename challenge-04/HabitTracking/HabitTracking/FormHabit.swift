//
//  FormHabit.swift
//  HabitTracking
//
//  Created by Fernando De La Rosa on 06/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct FormHabit: View {
	@State private var name = ""
	@State private var description = ""
	
	@Environment(\.presentationMode) var presentationMode
	
	@ObservedObject var items: Item
	
	var body: some View {
		NavigationView {
			/// New habit
			Form {
				Section(header: Text("Habit name")) {
					TextField("Name", text: $name)
				}
				Section(header: Text("Description")) {
					TextField("Description", text: $description)
				}
			}
			
			/// Tilte
				.navigationBarTitle(Text("Add new habit"), displayMode: .inline)
			
			/// Save habit
			.navigationBarItems(trailing:
				Button("Save") {
					let habit = Habit(name: self.name, description: self.description)
					self.items.habits.append(habit)
					self.presentationMode.wrappedValue.dismiss()
			})
		}
	}
}

struct FormHabit_Previews: PreviewProvider {
	static var previews: some View {
		FormHabit(items: Item())
	}
}
