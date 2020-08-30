//
//  ViewController.swift
//  Maps
//
//  Created by Fernando De La Rosa on 30/08/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
	// MARK: - Outlets
	@IBOutlet weak var mapView: MKMapView!
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	// MARK: - Setup
	private func setupView() {
		createCapitals()
	}
	
	private func createCapitals() {
		let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
		let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
		let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
		let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
		let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
		
		mapView.addAnnotations([london, oslo, paris, rome, washington])
	}
}

// MARK: - MKMapViewDelegate
extension ViewController: MKMapViewDelegate {
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		guard annotation is Capital else { return nil }
		let identifier = "Capital"
		var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
		if annotationView == nil {
			annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
			annotationView?.canShowCallout = true
			let btn = UIButton(type: .detailDisclosure)
			annotationView?.rightCalloutAccessoryView = btn
		} else {
			annotationView?.annotation = annotation
		}
		return annotationView
	}
	
	func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
		guard let capital = view.annotation as? Capital else { return }
		let placeName = capital.title
		let placeInfo = capital.info
		
		let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
}