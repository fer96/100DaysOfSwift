//
//  Person.swift
//  Faces
//
//  Created by Fernando De La Rosa on 01/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class Person: NSObject {
	var name: String
	var image: String
	
	init(name: String, image: String) {
		self.name = name
		self.image = image
	}
}
