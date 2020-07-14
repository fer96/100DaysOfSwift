//
//  DetailViewController.swift
//  Codable
//
//  Created by Fernando De La Rosa on 13/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
	// MARK: - Properties
	var webView: WKWebView!
	var detailItem: Petition?
	
	// MARK: - Life cycle
	override func loadView() {
		setupWebview()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	// MARK: - Setup view
	private func setupWebview() {
		webView = WKWebView()
		view = webView
	}
	
	private func setupView() {
		guard let detailItem = detailItem else { return }
		
		let html = """
		<html>
		<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style> body { font-size: 150%; } </style>
		</head>
		<body>
		\(detailItem.body)
		</body>
		</html>
		"""
		
		webView.loadHTMLString(html, baseURL: nil)
	}
}
