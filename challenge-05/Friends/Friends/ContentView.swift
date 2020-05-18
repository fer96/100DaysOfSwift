//
//  ContentView.swift
//  Friends
//
//  Created by Fernando De La Rosa on 17/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct ContentView: View {
	@State private var persons: [Person] = [Person]()
}

// MARK: - Logic
extension ContentView {
	func loadData() {
		guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
			return
		}
		
		let request = URLRequest(url: url)
		
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let data = data {
				if let decodedResponse = try? JSONDecoder().decode([Person].self, from: data) {
					DispatchQueue.main.async {
						self.persons = decodedResponse
					}
					return
				}
			} else {
				guard let _ = error else { return }
				/// Something was wrong
				
			}
		}.resume()
	}
}

// MARK: - View
extension ContentView {
	var body: some View {
		NavigationView {
			/// List of persons
			List(persons, id: \.id) { person in
				NavigationLink(destination: PersonView(person: person)) {
					VStack(alignment: .leading) {
						HStack {
							Text(person.name)
							Text("age: \(person.age)")
						}
						Text(person.company).foregroundColor(.gray)
					}
				}
			}
				/// Title
				.navigationBarTitle(Text("Persons"))
		}
			/// Load Data
			.onAppear(perform: loadData)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
