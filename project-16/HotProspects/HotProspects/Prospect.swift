//
//  Prospect.swift
//  HotProspects
//
//  Created by Fernando De La Rosa on 05/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
	let id = UUID()
	var name = "Anonymous"
	var emailAddress = ""
	fileprivate(set) var isContacted = false
}

extension Prospect: Comparable {
	static func < (lhs: Prospect, rhs: Prospect) -> Bool {
		lhs.name < rhs.name
	}
	
	static func == (lhs: Prospect, rhs: Prospect) -> Bool {
		// Do nothing
		true
	}
}

class Prospects: ObservableObject {
	@Published var people: [Prospect]
	static let saveKey = "SavedData"
	
	init() {
		if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
			if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
				self.people = decoded
				return
			}
		}
		
		self.people = []
	}
	
	func toggle(_ prospect: Prospect) {
		objectWillChange.send()
		prospect.isContacted.toggle()
		save()
	}
	
	private func save() {
			if let encoded = try? JSONEncoder().encode(people) {
					UserDefaults.standard.set(encoded, forKey: Self.saveKey)
			}
	}
	
	func add(_ prospect: Prospect) {
			people.append(prospect)
			save()
	}
}
