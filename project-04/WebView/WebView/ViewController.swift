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
	var progressView: UIProgressView!
	var websites = ["apple.com", "hackingwithswift.com"]

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
		
		let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
		
		progressView = UIProgressView(progressViewStyle: .default)
		progressView.sizeToFit()
		let progressButton = UIBarButtonItem(customView: progressView)
		
		toolbarItems = [progressButton, spacer, refresh]
		navigationController?.isToolbarHidden = false
	}
	
	@objc private func openTapped() {
		let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
		
		for website in websites {
			ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
		}
		
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
		webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
		
		let url = URL(string: "https://" + websites[0])!
		webView.load(URLRequest(url: url))
		
		webView.allowsBackForwardNavigationGestures = true
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		title = webView.title
	}
	
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		if keyPath == "estimatedProgress" {
			progressView.progress = Float(webView.estimatedProgress)
		}
	}
	
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		let url = navigationAction.request.url
		
		if let host = url?.host {
			for website in websites {
				if host.contains(website) {
					decisionHandler(.allow)
					return
				}
			}
		}
		
		decisionHandler(.cancel)
	}
}
