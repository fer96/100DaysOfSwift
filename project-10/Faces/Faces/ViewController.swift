//
//  ViewController.swift
//  Faces
//
//  Created by Fernando De La Rosa on 27/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
}

// MARK: - Collection view
extension ViewController {
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else { return UICollectionViewCell() }
		
		return cell
	}
}
