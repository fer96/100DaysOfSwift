//
//  PhotoCell.swift
//  Photos
//
//  Created by Fernando De La Rosa on 18/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
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
	
	func setup(_ photo: Photo) {
		let path = getDocumentsDirectory().appendingPathComponent(photo.image)
		img.image = UIImage(contentsOfFile: path.path)
		name.text = photo.name
	}
	
	private func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
}
