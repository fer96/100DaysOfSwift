//
//  MeView.swift
//  HotProspects
//
//  Created by Fernando De La Rosa on 05/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

// MARK: - Properties
struct MeView: View {
	@State private var name = "Anonymous"
	@State private var emailAddress = "you@yoursite.com"
	
	let context = CIContext()
	let filter = CIFilter.qrCodeGenerator()
}

// MARK: - Logic
extension MeView {
	func generateQRCode(from string: String) -> UIImage {
		let data = Data(string.utf8)
		filter.setValue(data, forKey: "inputMessage")
		
		if let outputImage = filter.outputImage {
			if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
				return UIImage(cgImage: cgimg)
			}
		}
		
		return UIImage(systemName: "xmark.circle") ?? UIImage()
	}
}

// MARK: - View
extension MeView {
	var body: some View {
		NavigationView {
			VStack {
				TextField("Name", text: $name)
					.textContentType(.name)
					.font(.title)
					.padding(.horizontal)
				
				TextField("Email address", text: $emailAddress)
					.textContentType(.emailAddress)
					.font(.title)
					.padding([.horizontal, .bottom])
				
				Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
					.interpolation(.none)
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 200)
				
				Spacer()
			}
			.navigationBarTitle("Your code")
		}
	}
}

struct MeView_Previews: PreviewProvider {
	static var previews: some View {
		MeView()
	}
}
