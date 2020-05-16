//
//  AddBookView.swift
//  Bookworm
//
//  Created by Fernando De La Rosa on 14/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct AddBookView: View {
	/// Enviroment variable to managment dismiss view
	@Environment(\.presentationMode) var presentationMode
	/// Context for Core Data
	@Environment(\.managedObjectContext) var moc
	
	@State private var title = ""
	@State private var author = ""
	@State private var rating = 3
	@State private var genre = ""
	@State private var review = ""
	
	let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
}

// MARK: - Logic
extension AddBookView {
	func checkBookInformation() -> Bool {
		title.isEmpty && author.isEmpty && genre.isEmpty && review.isEmpty
	}
}

// MARK: - View
extension AddBookView {
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Name of book", text: $title)
					TextField("Author's name", text: $author)
					
					Picker("Genre", selection: $genre) {
						ForEach(genres, id: \.self) {
							Text($0)
						}
					}
				}
				
				Section {
					Section {
						RatingView(rating: $rating)
						TextField("Write a review", text: $review)
					}
				}
				
				Section {
					Button("Save") {
						let newBook = Book(context: self.moc)
						newBook.title = self.title
						newBook.author = self.author
						newBook.rating = Int16(self.rating)
						newBook.genre = self.genre
						newBook.review = self.review
						newBook.date = Date()
						
						try? self.moc.save()
						self.presentationMode.wrappedValue.dismiss()
					}.disabled(checkBookInformation())
				}
			}
			.navigationBarTitle("Add Book")
		}
	}
}

struct AddBookView_Previews: PreviewProvider {
	static var previews: some View {
		AddBookView()
	}
}
