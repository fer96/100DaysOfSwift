//
//  Person.swift
//  Friends
//
//  Created by Fernando De La Rosa on 17/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import Foundation

struct Person: Codable {
	var id: String
	var name: String
	var age: Int
	var company: String
	var email: String
	var about: String
	var tags: [String]
	
	var friends: [Friend]
}

extension Person: Identifiable {}
