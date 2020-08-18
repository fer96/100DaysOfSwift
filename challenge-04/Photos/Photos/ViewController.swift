//
//  ViewController.swift
//  Photos
//
//  Created by Fernando De La Rosa on 18/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	// MARK: - Properties
	var photos: [Photo] = [Photo]()
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	// MARK: - Setup
	private func setupView() {
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPhoto))
	}
	
	// MARK: - Private methods
	@objc private func addNewPhoto() {
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		present(picker, animated: true)
	}
	
	private func save() {
		let jsonEncoder = JSONEncoder()
		if let savedData = try? jsonEncoder.encode(photos) {
			let defaults = UserDefaults.standard
			defaults.set(savedData, forKey: "photos")
		} else {
			print("Failed to save photos.")
		}
	}
	
	private func loadData() {
		let defaults = UserDefaults.standard
		
		if let savedPeople = defaults.object(forKey: "photos") as? Data {
			let jsonDecoder = JSONDecoder()
			
			do {
				photos = try jsonDecoder.decode([Photo].self, from: savedPeople)
			} catch {
				print("Failed to load photos")
			}
		}
	}
}

extension ViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		photos.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else { return UITableViewCell() }
		
		let photo = photos[indexPath.row]
		cell.setup(photo)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
			let photo = photos[indexPath.row]
			
			let path = getDocumentsDirectory().appendingPathComponent(photo.image)
			vc.img.image = UIImage(contentsOfFile: path.path)
			vc.descrip.text = photo.description
			
			navigationController?.pushViewController(vc, animated: true)
		}
	}
}

// MARK: - UIImage picker controller
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let image = info[.editedImage] as? UIImage else { return }
		
		let imageName = UUID().uuidString
		let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
		
		if let jpegData = image.jpegData(compressionQuality: 0.8) {
			try? jpegData.write(to: imagePath)
		}
		
		let photo = Photo(name: "Name", description: "Description", image: imageName)
		photos.append(photo)
		tableView.reloadData()
		
		save()
		
		dismiss(animated: true)
	}
	
	private func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
}
