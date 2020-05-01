//
//  ContentView.swift
//  Moonshot
//
//  Created by Fernando De La Rosa on 29/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	@State private var showCrew = false
	
	var body: some View {
		NavigationView {
			List(missions) { mission in
				NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
					Image(mission.image)
						.resizable()
						.scaledToFit()
						.frame(width: 44.0, height: 44.0)
					
					VStack(alignment: .leading) {
						Text(mission.displayName)
							.font(.headline)
						
						if self.showCrew {
							ForEach(mission.crew, id: \.name) { crewMember in
								Text(crewMember.name.capitalized)
							}
						} else {
							Text(mission.formattedLaunchDate)
						}
					}
				}
			}
			.navigationBarTitle("Moonshot")
			.navigationBarItems(leading:
				Button(showCrew == true ? "Launchdate" : "Crew") {
					self.showCrew.toggle()
				})
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
