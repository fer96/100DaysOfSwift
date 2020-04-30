//
//  AstronautView.swift
//  Moonshot
//
//  Created by Fernando De La Rosa on 30/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
	let astronaut: Astronaut
	
	var body: some View {
		GeometryReader { geometry in
			ScrollView(.vertical) {
				VStack {
					Image(self.astronaut.id)
						.resizable()
						.scaledToFit()
						.frame(width: geometry.size.width)
					
					Text(self.astronaut.description)
						.padding()
						.layoutPriority(1.0)
				}
			}
		}
		.navigationBarTitle(Text(astronaut.name), displayMode: .inline)
	}
}

struct AstronautView_Previews: PreviewProvider {
	static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
	
	static var previews: some View {
		AstronautView(astronaut: astronauts[0])
	}
}
