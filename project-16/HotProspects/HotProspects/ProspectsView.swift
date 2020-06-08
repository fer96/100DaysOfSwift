//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Fernando De La Rosa on 05/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI
import UserNotifications
import CodeScanner

enum FilterType {
	case none, contacted, uncontacted
}

// MARK: - Properties
struct ProspectsView: View {
	@EnvironmentObject var prospects: Prospects
	@State private var isShowingScanner = false
	@State private var sortingByRecent = false
	
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
extension ProspectsView {
	func handleScan(result: Result<String, CodeScannerView.ScanError>) {
		self.isShowingScanner = false
		
		switch result {
		case .success(let code):
			let details = code.components(separatedBy: "\n")
			guard details.count == 2 else { return }
			
			let person = Prospect()
			person.name = details[0]
			person.emailAddress = details[1]
			
			self.prospects.add(person)
		case .failure( _):
			print("Scanning failed")
		}
	}
	
	func addNotification(for prospect: Prospect) {
		let center = UNUserNotificationCenter.current()
		
		let addRequest = {
			let content = UNMutableNotificationContent()
			content.title = "Contact \(prospect.name)"
			content.subtitle = prospect.emailAddress
			content.sound = UNNotificationSound.default
			
			// This code was comment by testing purpose
			//			var dateComponents = DateComponents()
			//			dateComponents.hour = 9
			//			let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
			let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
			
			let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
			center.add(request)
		}
		
		center.getNotificationSettings { settings in
			if settings.authorizationStatus == .authorized {
				addRequest()
			} else {
				center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
					if success {
						addRequest()
					} else {
						print("D'oh")
					}
				}
			}
		}
	}
}

// MARK: - View
extension ProspectsView {
	var body: some View {
		NavigationView {
			List {
				ForEach(filteredProspects) { prospect in
					HStack {
						VStack(alignment: .leading) {
							Text(prospect.name)
								.font(.headline)
							Text(prospect.emailAddress)
								.foregroundColor(.secondary)
						}
						Spacer()
						Image(systemName: prospect.isContacted ? "checkmark.circle" : "questionmark.diamond").foregroundColor(.secondary)
					}
					.contextMenu {
						Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted" ) {
							self.prospects.toggle(prospect)
						}
						
						if !prospect.isContacted {
							Button("Remind Me") {
								self.addNotification(for: prospect)
							}
						}
						
						Button(self.sortingByRecent ? "Sorting by name" : "Sorting by most recent") {
							if self.sortingByRecent {
								self.prospects.people.reverse()
							} else {
								self.prospects.people.sort()
							}
							self.sortingByRecent.toggle()
						}
					}
				}
			}
			.navigationBarTitle(title)
			.navigationBarItems(trailing: Button(action: {
				self.isShowingScanner = true
			}) {
				Image(systemName: "qrcode.viewfinder")
				Text("Scan")
			})
				.sheet(isPresented: $isShowingScanner) {
					CodeScannerView(codeTypes: [.qr], simulatedData: "Zaul Hudson\npaul@hackingwithswift.com", completion: self.handleScan)
			}
		}
	}
}

struct ProspectsView_Previews: PreviewProvider {
	static var previews: some View {
		ProspectsView(filter: .none)
	}
}
