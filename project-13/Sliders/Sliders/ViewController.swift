//
//  ViewController.swift
//  Sliders
//
//  Created by Fernando De La Rosa on 20/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	// MARK: - Outlets
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var intensity: UISlider!
	
	// MARK: - Properties
	var currentImage: UIImage!
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	// MARK: - Setup
	private func setupView() {
		title = "YACIFP"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
	}
	
	// MARK: - Private methods

	// MARK: - IBActions
	@IBAction func changeFilter(_ sender: Any) {
	}
	
	@IBAction func save(_ sender: Any) {
	}
	
	@IBAction func changeIntensity(_ sender: Any) {
	}
}

// MARK: - Picker Controller
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	@objc private func importPicture() {
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		present(picker, animated: true)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let image = info[.editedImage] as? UIImage else { return }
		dismiss(animated: true)
		currentImage = image
	}
}
