//
//  ContentView.swift
//  Instafilter
//
//  Created by Fernando De La Rosa on 18/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

// MARK: - Properties
struct ContentView: View {
	@State private var image: Image?
	@State private var filterIntensity = 0.5
	@State private var showingImagePicker = false
	@State private var inputImage: UIImage?
	@State private var currentFilter = CIFilter.sepiaTone()
	
	let context = CIContext()
}

// MARK: - Logic
extension ContentView {
	func loadImage() {
		guard let inputImage = inputImage else { return }
		
		let beginImage = CIImage(image: inputImage)
		currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
		applyProcessing()
	}
	
	func applyProcessing() {
		currentFilter.intensity = Float(filterIntensity)
		
		guard let outputImage = currentFilter.outputImage else { return }
		
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			let uiImage = UIImage(cgImage: cgimg)
			image = Image(uiImage: uiImage)
		}
	}
}

// MARK: - View
extension ContentView {
	var body: some View {
		let intensity = Binding<Double>(
			get: {
				self.filterIntensity
		},
			set: {
				self.filterIntensity = $0
				self.applyProcessing()
		}
		)
		
		return NavigationView {
			VStack {
				ZStack {
					Rectangle()
						.fill(Color.secondary)
					
					if image != nil {
						image?
							.resizable()
							.scaledToFit()
					} else {
						Text("Tap to select a picture")
							.foregroundColor(.white)
							.font(.headline)
					}
				}
				.onTapGesture {
					self.showingImagePicker = true
				}
				
				HStack {
					Text("Intensity")
					Slider(value: intensity)
				}.padding(.vertical)
				
				HStack {
					Button("Change Filter") {
						// change filter
					}
					
					Spacer()
					
					Button("Save") {
						// save the picture
					}
				}
			}
			.padding([.horizontal, .bottom])
			.navigationBarTitle("Instafilter")
				
			.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
				ImagePicker(image: self.$inputImage)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
