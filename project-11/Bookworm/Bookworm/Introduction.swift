//
//  Introduction.swift
//  Bookworm
//
//  Created by Fernando De La Rosa on 13/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import Foundation

// MARK: - Creating a custom component with @Binding
//struct PushButton: View {
//	let title: String
//	@Binding var isOn: Bool
//
//	var onColors = [Color.red, Color.yellow]
//	var offColors = [Color(white: 0.6), Color(white: 0.4)]
//
//	var body: some View {
//		Button(title) {
//			self.isOn.toggle()
//		}
//		.padding()
//		.background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
//		.foregroundColor(.white)
//		.clipShape(Capsule())
//		.shadow(radius: isOn ? 0 : 5)
//	}
//}

// MARK: - Using size classes with AnyView type erasure
//struct ContentView: View {
//	@Environment(\.horizontalSizeClass) var sizeClass
//
//	var body: some View {
//		if sizeClass == .compact {
//			return AnyView(VStack {
//				Text("Active size class:")
//				Text("COMPACT")
//			}
//			.font(.largeTitle))
//		} else {
//			return AnyView(HStack {
//				Text("Active size class:")
//				Text("REGULAR")
//			}
//			.font(.largeTitle))
//		}
//	}
//}

// MARK: - Using Core Data with SwiftUI
//struct ContentView: View {
//	@Environment(\.managedObjectContext) var moc
//	@FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchRequest<Student>
//
//	var body: some View {
//		VStack {
//			List {
//				ForEach(students, id: \.id) { student in
//					Text(student.name ?? "Unknown")
//				}
//			}
//
//			Button("Add") {
//				let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
//				let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
//
//				let chosenFirstName = firstNames.randomElement()!
//				let chosenLastName = lastNames.randomElement()!
//
//				let student = Student(context: self.moc)
//				student.id = UUID()
//				student.name = "\(chosenFirstName) \(chosenLastName)"
//
//				try? self.moc.save()
//			}
//		}
//	}
//}
