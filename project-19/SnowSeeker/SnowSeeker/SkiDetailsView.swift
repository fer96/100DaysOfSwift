//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Fernando De La Rosa on 20/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct SkiDetailsView: View {
	let resort: Resort
	
	var body: some View {
		VStack {
			Text("Elevation: \(resort.elevation)m")
			Text("Snow: \(resort.snowDepth)cm")
		}
	}
}

struct SkiDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		SkiDetailsView(resort: Resort.example)
	}
}
