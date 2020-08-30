//
//  Capital.swift
//  Maps
//
//  Created by Fernando De La Rosa on 30/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
	// MARK: - Properties
	var title: String?
	var coordinate: CLLocationCoordinate2D
	var info: String
	
	// MARK: - Initializer
	init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
		self.title = title
		self.coordinate = coordinate
		self.info = info
	}
}
