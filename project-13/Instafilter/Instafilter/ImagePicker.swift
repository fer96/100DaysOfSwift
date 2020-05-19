//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Fernando De La Rosa on 19/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
	func makeUIViewController(context: Context) -> UIImagePickerController {
		let picker = UIImagePickerController()
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
	}
}
