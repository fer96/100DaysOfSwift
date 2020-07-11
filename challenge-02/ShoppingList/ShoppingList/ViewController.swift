//
//  ViewController.swift
//  ShoppingList
//
//  Created by Fernando De La Rosa on 11/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	// MARK: - Properties
	var items: [String] = [String]()

	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	// MARK: - Setup View
	private func setupView() {
		title = "Shopping List"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeAllItems))
	}
	
	// MARK: - Actions
	@objc private func addItem() {
		let ac = UIAlertController(title: "Add item", message: nil, preferredStyle: .alert)
		ac.addTextField()
		
		let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
			guard let answer = ac?.textFields?[0].text else { return }
			self?.submit(answer)
		}
		
		ac.addAction(submitAction)
		present(ac, animated: true)
	}
	
	@objc private func removeAllItems() {
		items.removeAll()
		tableView.reloadData()
	}
	
	// MARK: - Private methods
	private func submit(_ item: String) {
		items.insert(item, at: 0)
		
		let indexPath = IndexPath(row: 0, section: 0)
		tableView.insertRows(at: [indexPath], with: .automatic)
	}
}

// MARK: - Table view delegate
extension ViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		let item = items[indexPath.row]
		
		cell.textLabel?.text = item
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			items.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
}
