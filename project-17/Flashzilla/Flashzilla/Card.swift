//
//  Card.swift
//  Flashzilla
//
//  Created by Fernando De La Rosa on 11/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import Foundation

struct Card {
	let prompt: String
	let answer: String
	
	static var example: Card {
		Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
	}
}
