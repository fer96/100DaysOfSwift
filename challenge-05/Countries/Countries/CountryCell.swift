//
//  CountryCell.swift
//  Countries
//
//  Created by Fernando De La Rosa on 29/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
	// MARK: - Outlets
	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var capital: UILabel!

	func setup(_ country: Country) {
		name.text = country.name
		capital.text = country.capital
	}
}
