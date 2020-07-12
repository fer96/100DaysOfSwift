//
//  ViewController.swift
//  Codable
//
//  Created by Fernando De La Rosa on 12/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	// MARK: - Properties
	var petitions = [Petition]()

	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		loadData()
	}
	
	// MARK: - Private methods
	private func loadData() {
		let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
		
		if let url = URL(string: urlString) {
			if let data = try? Data(contentsOf: url) {
				parse(data)
			}
		}
	}
	
	private func parse(_ json: Data) {
		let decoder = JSONDecoder()
		
		if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
			petitions = jsonPetitions.results
			tableView.reloadData()
		}
	}
}

// MARK: - Table view delegate
extension ViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return petitions.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let petition = petitions[indexPath.row]
		cell.textLabel?.text = petition.title
		cell.detailTextLabel?.text = petition.body
		return cell
	}
}

