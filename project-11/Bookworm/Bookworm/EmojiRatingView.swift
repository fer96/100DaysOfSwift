//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Fernando De La Rosa on 14/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct EmojiRatingView: View {
	let rating: Int16
}

// MARK: - View
extension EmojiRatingView {
	var body: some View {
		switch rating {
		case 1:
			return Text("😴")
		case 2:
			return Text("☹️")
		case 3:
			return Text("😕")
		case 4:
			return Text("🙂")
		default:
			return Text("😃")
		}
	}
}

struct EmojiRatingView_Previews: PreviewProvider {
	static var previews: some View {
		EmojiRatingView(rating: 3)
	}
}
