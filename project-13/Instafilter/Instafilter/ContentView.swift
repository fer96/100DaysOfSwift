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
	@State private var inputImage: UIImage?
}

// MARK: - Logic
extension ContentView {
	func loadImage() {
		guard let inputImage = inputImage else { return }
		image = Image(uiImage: inputImage)
		
		let imageSaver = ImageSaver()
		imageSaver.writeToPhotoAlbum(image: inputImage)
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
		.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
			ImagePicker(image: self.$inputImage)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

// MARK: - Image saver
class ImageSaver: NSObject {
	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
	}
	
	@objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		print("Save finished!")
	}
}
