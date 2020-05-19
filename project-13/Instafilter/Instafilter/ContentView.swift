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
	@State private var showingImagePicker = false
}

// MARK: - Logic
extension ContentView {
	func loadImage() {
		guard let inputImage = UIImage(named: "example") else { return }
		let beginImage = CIImage(image: inputImage)
		let context = CIContext()
		
		let currentFilter = CIFilter.pixellate()
		currentFilter.inputImage = beginImage
		currentFilter.scale = 10
		
		// get a CIImage from our filter or exit if that fails
		guard let outputImage = currentFilter.outputImage else { return }
		
		// attempt to get a CGImage from our CIImage
		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			// convert that to a UIImage
			let uiImage = UIImage(cgImage: cgimg)
			
			// and convert that to a SwiftUI image
			image = Image(uiImage: uiImage)
		}
	}
}

// MARK: - View
extension ContentView {
	var body: some View {
		VStack {
			image?
				.resizable()
				.scaledToFit()
			
			Button("Select Image") {
				self.showingImagePicker = true
			}
		}
		.sheet(isPresented: $showingImagePicker) {
			ImagePicker()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
