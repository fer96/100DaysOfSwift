//
//  PersonCell.swift
//  Faces
//
//  Created by Fernando De La Rosa on 27/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
	// MARK: - IBOutlets
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var name: UILabel!
	
	func setup(_ person: Person) {
		name.text = person.name
		imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
		imageView.layer.borderWidth = 2
		imageView.layer.cornerRadius = 3
		layer.cornerRadius = 7
	}
}
