//
//  DetailView.swift
//  Flags
//
//  Created by Fernando De La Rosa on 30/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
	// MARK: - Properties
	var country: String = ""
	
	// MARK: - Outlets
	@IBOutlet weak var imgFlag: UIImageView!
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	// MARK: - Logic
	private func setup() {
		title = country.uppercased()
		navigationController?.navigationBar.prefersLargeTitles = false
		
		imgFlag.image = UIImage(named: country)
		imgFlag.layer.borderWidth = 3
		imgFlag.layer.borderColor = UIColor.gray.cgColor
	}
}
