//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Fernando De La Rosa on 05/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

enum FilterType {
	case none, contacted, uncontacted
}

// MARK: - Properties
struct ProspectsView: View {
	@EnvironmentObject var prospects: Prospects
	
	let filter: FilterType
	
	var title: String {
		switch filter {
		case .none:
			return "Everyone"
		case .contacted:
			return "Contacted people"
		case .uncontacted:
			return "Uncontacted people"
		}
	}
	
	var filteredProspects: [Prospect] {
		switch filter {
		case .none:
			return prospects.people
		case .contacted:
			return prospects.people.filter { $0.isContacted }
		case .uncontacted:
			return prospects.people.filter { !$0.isContacted }
		}
	}
}

// MARK: - Logic
extension ProspectsView {}

// MARK: - View
extension ProspectsView {
	var body: some View {
		NavigationView {
			List {
				ForEach(filteredProspects) { prospect in
					VStack(alignment: .leading) {
						Text(prospect.name)
							.font(.headline)
						Text(prospect.emailAddress)
							.foregroundColor(.secondary)
					}
				}
			}
			.navigationBarTitle(title)
			.navigationBarItems(trailing: Button(action: {
				let prospect = Prospect()
				prospect.name = "Paul Hudson"
				prospect.emailAddress = "paul@hackingwithswift.com"
				self.prospects.people.append(prospect)
			}) {
				Image(systemName: "qrcode.viewfinder")
				Text("Scan")
			})
		}
	}
}

struct ProspectsView_Previews: PreviewProvider {
	static var previews: some View {
		ProspectsView(filter: .none)
	}
}
