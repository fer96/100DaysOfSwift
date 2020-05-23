//
//  ContentView.swift
//  BucketList
//
//  Created by Fernando De La Rosa on 23/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct User: Identifiable, Comparable {
	let id = UUID()
	let firstName: String
	let lastName: String
	
	static func < (lhs: User, rhs: User) -> Bool {
		lhs.lastName < rhs.lastName
	}
}

enum LoadingState {
	case loading, success, failed
}

struct LoadingView: View {
	var body: some View {
		Text("Loading...")
	}
}

struct SuccessView: View {
	var body: some View {
		Text("Success!")
	}
}

struct FailedView: View {
	var body: some View {
		Text("Failed.")
	}
}

// MARK: - Properties

struct ContentView: View {
	let users = [
		User(firstName: "Arnold", lastName: "Rimmer"),
		User(firstName: "Kristine", lastName: "Kochanski"),
		User(firstName: "David", lastName: "Lister"),
		].sorted()
	
	var loadingState = LoadingState.loading
}

// MARK: - Logic

extension ContentView {
	func getDocumentsDirectory() -> URL {
		// find all possible documents directories for this user
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		
		// just send back the first one, which ought to be the only one
		return paths[0]
	}
}

// MARK: - View
extension ContentView {
	var body: some View {
		Group {
			if loadingState == .loading {
				LoadingView()
			} else if loadingState == .success {
				SuccessView()
			} else if loadingState == .failed {
				FailedView()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
