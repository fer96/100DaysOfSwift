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
		let urlString: String
		
		if navigationController?.tabBarItem.tag == 0 {
			// urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
			urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
		} else {
			// urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
			urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
		}
		
		if let url = URL(string: urlString) {
			if let data = try? Data(contentsOf: url) {
				parse(data)
			} else {
				showError()
			}
		} else {
			showError()
		}
	}
	
	private func parse(_ json: Data) {
		let decoder = JSONDecoder()
		
		if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
			petitions = jsonPetitions.results
			tableView.reloadData()
		}
	}
	
	private func showError() {
		let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
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
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = DetailViewController()
		vc.detailItem = petitions[indexPath.row]
		navigationController?.pushViewController(vc, animated: true)
	}
}

