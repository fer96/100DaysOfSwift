//
//  ViewController.swift
//  Flags
//
//  Created by Fernando De La Rosa on 30/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	
	// MARK: - Properties
	var countries = [String]()

	// MARK: - Life cylce
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
		loadCountries()
	}
	
	// MARK: - Table View
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		countries.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell") as? FlagCell else { return UITableViewCell() }
		let country = countries[indexPath.row]
		
		cell.setup(country: country)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let detailVC = storyboard?.instantiateViewController(identifier: "Detail") as? DetailView else {
			return 
		}
		
		let country = countries[indexPath.row]
		detailVC.country = country
		
		navigationController?.pushViewController(detailVC, animated: true)
	}
	
	// MARK: - Logic
	private func setup() {
		title = "Flags"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	private func loadCountries() {
		countries.append("estonia")
		countries.append("france")
		countries.append("germany")
		countries.append("ireland")
		countries.append("italy")
		countries.append("monaco")
		countries.append("nigeria")
		countries.append("poland")
		countries.append("russia")
		countries.append("spain")
		countries.append("uk")
		countries.append("us")
		
		countries.sort()
	}
}

