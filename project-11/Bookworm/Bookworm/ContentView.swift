//
//  ContentView.swift
//  Bookworm
//
//  Created by Fernando De La Rosa on 13/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct ContentView: View {
	/// Create enviroment to manage Cora Data
	@Environment(\.managedObjectContext) var moc
	/// Create fetch request for all Books objects in Core Data
	@FetchRequest(entity: Book.entity(), sortDescriptors: [
			NSSortDescriptor(keyPath: \Book.title, ascending: true),
			NSSortDescriptor(keyPath: \Book.author, ascending: true)
	]) var books: FetchedResults<Book>
	
	@State private var showingAddScreen = false
}

// MARK: - Logic
extension ContentView {
	func deleteBooks(at offsets: IndexSet) {
		for offset in offsets {
			// find this book in our fetch request
			let book = books[offset]
			// delete it from the context
			moc.delete(book)
		}
		// save the context
		try? moc.save()
	}
}

// MARK: - View
extension ContentView {
	var body: some View {
		NavigationView {
			List {
				ForEach(books, id: \.self) { book in
					NavigationLink(destination: DetailView(book: book)) {
						EmojiRatingView(rating: book.rating).font(.largeTitle)
						
						VStack(alignment: .leading) {
							Text(book.title ?? "Unkown title").font(.headline)
							Text(book.author ?? "Unknown Author").foregroundColor(.secondary)
						}
					}
				}
				.onDelete(perform: deleteBooks)
			}
			.navigationBarTitle("Bookworm")
			.navigationBarItems(leading: EditButton(), trailing: Button(action: {
				self.showingAddScreen.toggle()
			}) {
				Image(systemName: "plus")
			})
				.sheet(isPresented: $showingAddScreen) {
					AddBookView().environment(\.managedObjectContext, self.moc)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
