//
//  DetailViewController.swift
//  Countries
//
//  Created by Fernando De La Rosa on 29/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	// MARK: - Outlets
	@IBOutlet weak var flagImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var capitalLabel: UILabel!
	@IBOutlet weak var populationLabel: UILabel!
	
	// MARK: - Properties
	var country: Country?
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	// MARK: - Setup
	private func setupView() {
		flagImageView.image = UIImage()
		nameLabel.text = country?.name
		capitalLabel.text = country?.capital
		populationLabel.text = "Population: \(country?.population ?? 0)"
	}
	
	// MARK: - Private Methods
	private func requestFlagImageData() {
		// add more code
	}
}
