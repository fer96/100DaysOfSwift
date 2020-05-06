//
//  HabitView.swift
//  HabitTracking
//
//  Created by Fernando De La Rosa on 06/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct HabitView: View {
	var habit: Habit
	
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		NavigationView {
			HStack {
				VStack {
					Text("You had compete \(habit.description) \(habit.count) times")
					
					Button("Plus one time") {
						self.habit.addTime()
						self.presentationMode.wrappedValue.dismiss()
					}
				}
			}
				
			/// Title
				.navigationBarTitle(Text(habit.name), displayMode: .inline)
		}
	}
}

struct HabitView_Previews: PreviewProvider {
	static var previews: some View {
		HabitView(habit: Habit(name: "Example", description: "Description example"))
	}
}
