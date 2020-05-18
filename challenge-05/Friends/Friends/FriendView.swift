//
//  FriendView.swift
//  Friends
//
//  Created by Fernando De La Rosa on 17/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct FriendView: View {
	@State private var persons: [Person] = [Person]()
	let friend: Friend
	
	var person: Person {
		persons.first {
			$0.id == friend.id
			} ?? Person(id: "Unkown", name: "Unkown", age: 0, company: "Unkown", email: "Unkown", about: "Unkown", tags: ["Unkown"], friends: [friend])
	}
}

// MARK: - Logic
extension FriendView {
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
			}
		}.resume()
	}
}

// MARK: - View
extension FriendView{
	var body: some View {
		Form {
			/// Information section
			Section(header: Text("Information")) {
				HStack {
					Text("Name: \(friend.name)")
					Text("Age: \(person.age)")
				}
				Text("Work at: \(person.company)")
			}
		}
		.onAppear(perform: loadData)
	}
}

struct FriendView_Previews: PreviewProvider {
	static let mockFriend = Friend(id: "9", name: "H-u")
	
	static var previews: some View {
		FriendView(friend: mockFriend)
	}
}
