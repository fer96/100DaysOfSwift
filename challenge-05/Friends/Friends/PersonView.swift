//
//  PersonView.swift
//  Friends
//
//  Created by Fernando De La Rosa on 17/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct PersonView: View {
	let person: Person
}

//MARK: - Logic
extension PersonView {
}

// MARK: - View
extension PersonView {
	var body: some View {
		Form {
			/// Information section
			Section(header: Text("Basic information")) {
				HStack {
					Text("Age: \(person.age)")
					Text("Work at: \(person.company)")
				}
				Text("Email: \(person.email)")
			}
			
			/// About section
			Section(header: Text("Description")) {
				Text(person.about)
			}
			
			/// Tags section
			Section(header: Text("Tags")) {
				List(person.tags, id: \.self) { tag in
					Text(tag)
				}
			}
			
			/// Friends section
			Section(header: Text("Friends")) {
				List(person.friends, id: \.id) { friend in
					NavigationLink(destination: FriendView(friend: friend)) {
						VStack(alignment: .leading) {
							Text(friend.name)
						}
					}
				}
			}
			.navigationBarTitle(Text(person.name), displayMode: .inline)
		}
	}
}

struct PersonView_Previews: PreviewProvider {
	static let mockPerson = Person(id: "96", name: "Fernando", age: 23, company: "Globex", email: "fer@email.com", about: "GG Gamer and Geek", tags: ["A", "B"], friends: [Friend(id: "9", name: "H-U")])
	
	static var previews: some View {
		PersonView(person: mockPerson)
	}
}
