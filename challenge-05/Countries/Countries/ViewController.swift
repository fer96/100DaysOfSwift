//
//  ViewController.swift
//  Countries
//
//  Created by Fernando De La Rosa on 29/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	// MARK: - Properties
	var countries: [Country] = [Country]()

	// MARK: - Life cylce
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		requestCountriesData()
	}
	
	// MARK: - Private Methods
	private func setupView() {
		title = "Countries"
		tableView.tableFooterView = UIView()
	}
	
	private func requestCountriesData() {
		let endPoint = "https://restcountries-v1.p.rapidapi.com/all"
		guard let url = URL(string: endPoint) else {
			print("Invalid URL")
			return
		}
		let request = URLRequest(url: url)
		URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
			self?.parseDataToCountries(data, error)
		}.resume()
	}
	
	private func parseDataToCountries(_ data: Data?, _ error: Error?) {
		if let data = data {
			if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
				DispatchQueue.main.async {
					self.countries = decodedResponse.countries
				}
				return
			}
		}
		print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
	}
}

// MARK: - Table View Methods
extension ViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		countries.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as? CountryCell else { return UITableViewCell() }
		let country = countries[indexPath.row]
		cell.setup(country)
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let country = countries[indexPath.row]
		let detailView = createDetailView(with: country)
		navigationController?.pushViewController(detailView, animated: true)
	}
	
	// MARK: - Private Methods
	private func createDetailView(with country: Country) -> UIViewController {
		guard let detailView = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return UIViewController() }
		detailView.country = country
		return detailView
	}
}
