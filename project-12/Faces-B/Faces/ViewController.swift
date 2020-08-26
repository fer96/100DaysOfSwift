//
//  ViewController.swift
//  Faces
//
//  Created by Fernando De La Rosa on 27/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
	var people = [Person]()
	
	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		loadData()
	}
	
	// MARK: - Setup
	private func setupView() {
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
	}
	
	// MARK: - Private methods
	@objc private func addNewPerson() {
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		present(picker, animated: true)
	}
	
	private func save() {
		let jsonEncoder = JSONEncoder()
		if let savedData = try? jsonEncoder.encode(people) {
			let defaults = UserDefaults.standard
			defaults.set(savedData, forKey: "people")
		} else {
			print("Failed to save people.")
		}
	}
	
	private func loadData() {
		let defaults = UserDefaults.standard
		
		if let savedPeople = defaults.object(forKey: "people") as? Data {
			let jsonDecoder = JSONDecoder()
			
			do {
				people = try jsonDecoder.decode([Person].self, from: savedPeople)
			} catch {
				print("Failed to load people")
			}
		}
	}
}

// MARK: - Collection view
extension ViewController {
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		people.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else { return UICollectionViewCell() }
		
		let person = people[indexPath.item]
		
		cell.setup(person)
		let path = getDocumentsDirectory().appendingPathComponent(person.image)
		cell.imageView.image = UIImage(contentsOfFile: path.path)
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let person = people[indexPath.item]
		
		let ac = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
		ac.addTextField()
		
		ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		
		ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] _ in
			guard let newName = ac?.textFields?[0].text else { return }
			person.name = newName
			
			self?.collectionView.reloadData()
			self?.save()
		})
		
		present(ac, animated: true)
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
		
		let person = Person(name: "Unknown", image: imageName)
		people.append(person)
		collectionView.reloadData()
		
		save()
		
		dismiss(animated: true)
	}
	
	private func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
}