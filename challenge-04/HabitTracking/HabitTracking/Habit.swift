//
//  Habit.swift
//  HabitTracking
//
//  Created by Fernando De La Rosa on 06/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import Foundation

class Habit: Identifiable, Codable {
	let id = UUID()
	var name: String
	var description: String
	var count: Int = 0
	
	init(name: String, description: String) {
		self.name = name
		self.description = description
	}
	
	func addTime() {
		count += 1
	}
}

class Item: ObservableObject, Codable {
	var habits: [Habit] = [Habit]()
}
