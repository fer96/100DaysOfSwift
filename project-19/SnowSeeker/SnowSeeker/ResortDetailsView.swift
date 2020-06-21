//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Fernando De La Rosa on 20/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct ResortDetailsView: View {
	let resort: Resort
	
	var size: String {
		switch resort.size {
		case 1:
			return "Small"
		case 2:
			return "Average"
		default:
			return "Large"
		}
	}
	var price: String {
		String(repeating: "$", count: resort.price)
	}
}

// MARK: - View
extension ResortDetailsView {
	var body: some View {
		Group {
			Text("Size: \(size)").layoutPriority(1)
			Spacer()
			Text("Price: \(price)").layoutPriority(1)
		}
	}
}

struct ResortDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		ResortDetailsView(resort: Resort.example)
	}
}
