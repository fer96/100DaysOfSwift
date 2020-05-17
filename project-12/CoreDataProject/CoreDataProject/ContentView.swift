//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Fernando De La Rosa on 16/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI
import CoreData

// MARK: - Predicates
enum Predicate: String {
	case BEGINSWITH
	case CONTAINS
}

// MARK: - Properties
struct ContentView: View {
	@Environment(\.managedObjectContext) var moc
	@State private var lastNameFilter = "A"
	
	let sortedByNameDescending = NSSortDescriptor(keyPath: \Singer.firstName, ascending: false)
}

// MARK: - View
extension ContentView {
	var body: some View {
		VStack {
			FilteredList(filterKey: "lastName", predicate: .BEGINSWITH, filterValue: lastNameFilter, sortDescriptors: [sortedByNameDescending]) { (singer: Singer) in
				Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
			}
			
			Button("Add Examples") {
				let taylor = Singer(context: self.moc)
				taylor.firstName = "Taylor"
				taylor.lastName = "Swift"
				
				let ed = Singer(context: self.moc)
				ed.firstName = "Ed"
				ed.lastName = "Sheeran"
				
				let adele = Singer(context: self.moc)
				adele.firstName = "Adele"
				adele.lastName = "Adkins"
				
				let robert = Singer(context: self.moc)
				robert.firstName = "Robert"
				robert.lastName = "Adkins"
				
				try? self.moc.save()
			}
			
			Button("Show A") {
				self.lastNameFilter = "A"
			}
			
			Button("Show S") {
				self.lastNameFilter = "S"
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
