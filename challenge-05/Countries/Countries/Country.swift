//
//  Country.swift
//  Countries
//
//  Created by Fernando De La Rosa on 29/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import Foundation

struct Country: Codable {
	var name: String
	var capital: String
	var population: Int?
	var flag: String?
}

struct Response: Codable {
	var countries: [Country]
}
