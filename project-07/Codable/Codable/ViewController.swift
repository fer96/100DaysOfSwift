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
	var filterPetitions = [Petition]()

	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		loadData()
	}
	
	// MARK: - Private methods
	private func setupView() {
		title = "News"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filter))
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(presentCredits))
	}
	
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
			filterPetitions = petitions
			tableView.reloadData()
		}
	}
	
	private func showError() {
		let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
	
	@objc private func filter() {
		let ac = UIAlertController(title: "Search", message: "News with", preferredStyle: .alert)
		ac.addTextField { (query) in
			guard let queryString = query.text else { return }
			self.filterPetitions.removeAll()
			for petition in self.petitions {
				if petition.title.contains(queryString) {
					self.filterPetitions.append(petition)
				}
			}
		}
		ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_ ) in
			self.tableView.reloadData()
		}))
		present(ac, animated: true)
	}
	
	@objc private func presentCredits() {
		let ac = UIAlertController(title: "Data got from", message: "We The People API of the Whitehouse.", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
}

// MARK: - Table view delegate
extension ViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filterPetitions.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let petition = filterPetitions[indexPath.row]
		cell.textLabel?.text = petition.title
		cell.detailTextLabel?.text = petition.body
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = DetailViewController()
		vc.detailItem = filterPetitions[indexPath.row]
		navigationController?.pushViewController(vc, animated: true)
	}
}

