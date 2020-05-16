//
//  DetailView.swift
//  Bookworm
//
//  Created by Fernando De La Rosa on 15/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI
import CoreData

// MARK: - Properties
struct DetailView: View {
	@Environment(\.managedObjectContext) var moc
	@Environment(\.presentationMode) var presentationMode
	@State private var showingDeleteAlert = false
	
	let book: Book
	
	static let taskDateFormat: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .long
		return formatter
	}()
}

// MARK: - Logic
extension DetailView {
	func deleteBook() {
		moc.delete(book)
		
		// uncomment this line if you want to make the deletion permanent
		// try? self.moc.save()
		presentationMode.wrappedValue.dismiss()
	}
}

// MARK: - View
extension DetailView {
	var body: some View {
		GeometryReader { geometry in
			VStack {
				ZStack(alignment: .bottomTrailing) {
					Image(self.book.genre ?? "Fantasy")
						.frame(maxWidth: geometry.size.width)
					
					Text(self.book.genre?.uppercased() ?? "FANTASY")
						.font(.caption)
						.fontWeight(.black)
						.padding(8)
						.foregroundColor(.white)
						.background(Color.black.opacity(0.75))
						.clipShape(Capsule())
						.offset(x: -5, y: -5)
				}
				
				Text(self.book.author ?? "Unknown author")
					.font(.title)
					.foregroundColor(.secondary)
				
				Text(self.book.review ?? "No review").padding()
				
				Text("\(self.book.date ?? Date(), formatter: Self.taskDateFormat)").padding()
				
				RatingView(rating: .constant(Int(self.book.rating)))
					.font(.largeTitle)
				
				Spacer()
			}
		}
			/// Title
			.navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
			
			/// NavBar buttons
			.navigationBarItems(trailing: Button(action: {
				self.showingDeleteAlert = true
			}) {
				Image(systemName: "trash")
			})
			
			/// Alert
			.alert(isPresented: $showingDeleteAlert) {
				Alert(title: Text("Delete book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
					self.deleteBook()
					}, secondaryButton: .cancel()
				)
		}
	}
}

struct DetailView_Previews: PreviewProvider {
	static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
	
	static var previews: some View {
		let book = Book(context: moc)
		book.title = "Test book"
		book.author = "Test author"
		book.genre = "Fantasy"
		book.rating = 4
		book.review = "This was a great book; I really enjoyed it."
		
		return NavigationView {
			DetailView(book: book)
		}
	}
}
