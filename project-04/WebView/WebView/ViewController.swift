//
//  ViewController.swift
//  WebView
//
//  Created by Fernando De La Rosa on 01/07/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
	// MARK: - Properties
	var webView: WKWebView!

	// MARK: - Life cycle
	override func loadView() {
		createWebView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupWebView()
	}
	
	// MARK: - Logic
	private func createWebView() {
		webView = WKWebView()
		webView.navigationDelegate = self
		view = webView
	}
	
	private func setupView() {
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
	}
	
	@objc private func openTapped() {
		let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
		ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
		ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
		ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
		present(ac, animated: true)
	}
	
	private func openPage(action: UIAlertAction) {
		let url = URL(string: "https://" + action.title!)!
		webView.load(URLRequest(url: url))
	}
}

// MARK: - Web View delegate
extension ViewController: WKNavigationDelegate {
	private func setupWebView() {
		let url = URL(string: "https://www.hackingwithswift.com")!
		webView.load(URLRequest(url: url))
		webView.allowsBackForwardNavigationGestures = true
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		title = webView.title
	}
}
