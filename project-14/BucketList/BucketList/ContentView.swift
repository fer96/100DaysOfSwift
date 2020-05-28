//
//  ContentView.swift
//  BucketList
//
//  Created by Fernando De La Rosa on 23/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI
import MapKit
import LocalAuthentication

// MARK: - Properties
struct ContentView: View {
	@State private var centerCoordinate = CLLocationCoordinate2D()
	@State private var locations = [CodableMKPointAnnotation]()
	@State private var selectedPlace: MKPointAnnotation?
	@State private var showingPlaceDetails = false
	@State private var showingEditScreen = false
	@State private var isUnlocked = false
	@State private var alertTile = "Unknown"
	@State private var alertMessage = "Missing place information."
}

// MARK: - Logic
extension ContentView {
	func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
	
	func loadData() {
		let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
		
		do {
			let data = try Data(contentsOf: filename)
			locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
		} catch {
			print("Unable to load saved data.")
		}
	}
	
	func saveData() {
		do {
			let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
			let data = try JSONEncoder().encode(self.locations)
			try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
		} catch {
			print("Unable to save data.")
		}
	}
	
	func authenticate() {
		let context = LAContext()
		var error: NSError?
		
		if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
			let reason = "Please authenticate yourself to unlock your places."
			
			context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
				
				DispatchQueue.main.async {
					if success {
						self.isUnlocked = true
					} else {
						self.showingPlaceDetails = true
						self.alertTile = "Error!"
						self.alertMessage = "Face ID does not match"
					}
				}
			}
		} else {
			self.showingPlaceDetails = true
			self.alertTile = "Error!"
			self.alertMessage = "You must be enroll your Face ID"
		}
	}
}

// MARK: - View
extension ContentView {
	var body: some View {
		ZStack {
			if isUnlocked {
				MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
					.edgesIgnoringSafeArea(.all)
				Circle()
					.fill(Color.blue)
					.opacity(0.3)
					.frame(width: 32, height: 32)
				
				VStack {
					Spacer()
					HStack {
						Spacer()
						Button(action: {
							// create a new location
							let newLocation = CodableMKPointAnnotation()
							newLocation.coordinate = self.centerCoordinate
							newLocation.title = "Example location"
							self.locations.append(newLocation)
							
							self.selectedPlace = newLocation
							self.showingEditScreen = true
						}) {
							Image(systemName: "plus")
						}
						.padding()
						.background(Color.black.opacity(0.75))
						.foregroundColor(.white)
						.font(.title)
						.clipShape(Circle())
						.padding(.trailing)
					}
				}
			} else {
				Button("Unlock Places") {
					self.authenticate()
				}
				.padding()
				.background(Color.blue)
				.foregroundColor(.white)
				.clipShape(Capsule())
			}
		}
		.alert(isPresented: $showingPlaceDetails) {
			Alert(title: Text(selectedPlace?.title ?? alertTile), message: Text(selectedPlace?.subtitle ?? alertMessage), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
				/// edit this place
				self.showingEditScreen = true
				})
		}
			
		.sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
			if self.selectedPlace != nil {
				EditView(placemark: self.selectedPlace!)
			}
		}
			
		.onAppear(perform: loadData)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
