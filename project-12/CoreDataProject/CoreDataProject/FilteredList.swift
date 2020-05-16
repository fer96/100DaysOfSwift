//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Fernando De La Rosa on 16/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI
import CoreData

// MARK: - Properties
struct FilteredList<T: NSManagedObject, Content: View>:View {
	var fetchRequest: FetchRequest<T>
	var singers: FetchedResults<T> { fetchRequest.wrappedValue }
	
	// this is our content closure; we'll call this once for each item in the list
	let content: (T) -> Content
}

// MARK: - Logic
extension FilteredList {
	init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
		fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
		self.content = content
	}
}

// MARK: - View
extension FilteredList {
	var body: some View {
		List(fetchRequest.wrappedValue, id: \.self) { singer in
			self.content(singer)
		}
	}
}

