//
//  FlagCell.swift
//  Flags
//
//  Created by Fernando De La Rosa on 30/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class FlagCell: UITableViewCell {
	
	// MARK: - Outlets
	@IBOutlet weak var img: UIImageView!
	@IBOutlet weak var name: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
	// MARK: - Logic
	func setup(country: String) {
		name.text = country.uppercased()
		img.image = UIImage(named: country)
	}
}
