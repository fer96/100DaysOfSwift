//
//  ViewController.swift
//  Debuggin
//
//  Created by Fernando De La Rosa on 03/09/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		breakpointsDebbugging()
	}

	/// Not the better way for debbug but always useful
	private func basicDebugging() {
		print(1, 2, 3, 4, 5, separator: "-")
		print("Some message", terminator: "")
	}

	/**
	These assertion crashes only happen while you’re debugging. When you build a release version of your app – i.e., when you ship your app to the App Store – Xcode automatically disables your assertions so they won’t reach your users. This means you can set up an extremely strict environment while you’re developing, ensuring that all values are present and correct, without causing problems for real users.
	*/
	private func assertDebbuging() {
		assert(1 == 1, "Maths failure!")
		assert(1 == 2, "Maths failure!")
	}
	
	private func breakpointsDebbugging() {
		for i in 1 ... 100 {
			print("Got number \(i)")
		}
	}
}

