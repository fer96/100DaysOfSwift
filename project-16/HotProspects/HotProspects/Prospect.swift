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

class Prospects: ObservableObject {
	@Published var people: [Prospect]
	
	init() {
		self.people = []
	}
	
	func toggle(_ prospect: Prospect) {
		objectWillChange.send()
		prospect.isContacted.toggle()
	}
}
