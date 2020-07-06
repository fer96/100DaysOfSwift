//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Fernando De La Rosa on 25/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	// MARK: - Properties
	var selectedImage: String?
	
	// MARK: - Outlets
	@IBOutlet weak var imageView: UIImageView!
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()

		navigationItem.largeTitleDisplayMode = .never
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
		
		if let imageToLoad = selectedImage {
			imageView.image  = UIImage(named: imageToLoad)
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
	}
	
	// MARK: - Logic
	@objc func shareTapped() {
		guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
			print("No image found")
			return
		}
		
		guard let imageName = selectedImage else { return }
		
		let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc, animated: true)
	}
}