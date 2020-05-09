//
//  Order.swift
//  CupcakeCorner
//
//  Created by Fernando De La Rosa on 09/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import Foundation

// MARK: - Data
class Order: ObservableObject {
	/// Order Data
	static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
	@Published var type = 0
	@Published var quantity = 3
	@Published var extraFrosting = false
	@Published var addSprinkles = false
	@Published var specialRequestEnabled = false {
		didSet {
			if specialRequestEnabled == false {
				extraFrosting = false
				addSprinkles = false
			}
		}
	}
	
	/// Address data
	@Published var name = ""
	@Published var streetAddress = ""
	@Published var city = ""
	@Published var zip = ""
	var hasValidAddress: Bool {
		if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
			return false
		}
		return true
	}
	
	/// Checkout data
	var cost: Double {
		// $2 per cake
		var cost = Double(quantity) * 2
		
		// complicated cakes cost more
		cost += (Double(type) / 2)
		
		// $1/cake for extra frosting
		if extraFrosting {
			cost += Double(quantity)
		}
		
		// $0.50/cake for sprinkles
		if addSprinkles {
			cost += Double(quantity) / 2
		}
		
		return cost
	}
}
