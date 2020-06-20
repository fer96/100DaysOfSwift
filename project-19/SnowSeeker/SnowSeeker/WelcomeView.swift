//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Fernando De La Rosa on 20/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
	var body: some View {
		VStack {
			Text("Welcome to SnowSeeker!")
				.font(.largeTitle)
			
			Text("Please select a resort from the left-hand menu; swipe from the left edge to show it.")
				.foregroundColor(.secondary)
		}
	}
}
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
