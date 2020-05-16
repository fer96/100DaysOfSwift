//
//  RatingView.swift
//  Bookworm
//
//  Created by Fernando De La Rosa on 14/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct RatingView: View {
	@Binding var rating: Int
	
	var label = ""
	
	var maximumRating = 5
	
	var offImage: Image?
	var onImage = Image(systemName: "star.fill")
	
	var offColor = Color.gray
	var onColor = Color.yellow
}

// MARK: - Logic
extension RatingView {
	func image(for number: Int) -> Image {
		if number > rating {
			return offImage ?? onImage
		} else {
			return onImage
		}
	}
}

// MARK: - View
extension RatingView {
	var body: some View {
		HStack {
			if label.isEmpty == false {
				Text(label)
			}
			
			ForEach(1..<maximumRating + 1) { number in
				self.image(for: number)
					.foregroundColor(number > self.rating ? self.offColor : self.onColor)
					.onTapGesture {
						self.rating = number
				}
			}
		}
	}
}

struct RatingView_Previews: PreviewProvider {
	static var previews: some View {
		RatingView(rating: .constant(3))
	}
}