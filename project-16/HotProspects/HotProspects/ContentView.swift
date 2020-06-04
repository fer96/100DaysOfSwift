//
//  ContentView.swift
//  HotProspects
//
//  Created by Fernando De La Rosa on 02/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI
import UserNotifications
import SamplePackage

struct LNContentView: View {
	
	var body: some View {
		VStack {
			Button("Request Permission") {
				UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
					if success {
						print("All set!")
					} else if let error = error {
						print(error.localizedDescription)
					}
				}
			}
			
			Button("Schedule Notification") {
				let content = UNMutableNotificationContent()
				content.title = "Feed the cat"
				content.subtitle = "It looks hungry"
				content.sound = UNNotificationSound.default
				
				// show this notification five seconds from now
				let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
				
				// choose a random identifier
				let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
				
				// add our notification request
				UNUserNotificationCenter.current().add(request)
			}
		}
	}
}

struct ContentView: View {
	let possibleNumbers = Array(1...60)
	
	var results: String {
		let selected = possibleNumbers.random(7).sorted()
		let strings = selected.map(String.init)
		return strings.joined(separator: ", ")
	}
	
	var body: some View {
		Text(results)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
