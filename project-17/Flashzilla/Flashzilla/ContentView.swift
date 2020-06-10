//
//  ContentView.swift
//  Flashzilla
//
//  Created by Fernando De La Rosa on 09/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
}

// MARK: - View
extension ContentView {
	var body: some View {
		VStack {
			Text("Hello, World!")
				.onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
					print("Moving to the background!")
			}
			
			Text("Hello, World!")
				.onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
					print("Moving back to the foreground!")
			}
			
			Text("Hello, World!")
				.onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
					print("User took a screenshot!")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
