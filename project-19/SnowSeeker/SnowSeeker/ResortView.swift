//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Fernando De La Rosa on 20/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct ResortView: View {
	@Environment(\.horizontalSizeClass) var sizeClass
	@EnvironmentObject var favorites: Favorites
	
	@State private var selectedFacility: Facility?
	
	let resort: Resort
}

// MARK: - View
extension ResortView {
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 0) {
				Image(decorative: resort.id)
					.resizable()
					.scaledToFit()
				
				Group {
					HStack {
						if sizeClass == .compact {
							Spacer()
							VStack { ResortDetailsView(resort: resort) }
							VStack { SkiDetailsView(resort: resort) }
							Spacer()
						} else {
							ResortDetailsView(resort: resort)
							Spacer()
							SkiDetailsView(resort: resort)
						}
					}
					.font(.headline)
					.foregroundColor(.secondary)
					.padding(.top)
					
					Text(resort.description)
						.padding(.vertical)
					
					Text("Facilities")
						.font(.headline)
					
					HStack {
						ForEach(resort.facilityTypes) { facility in
							facility.icon
								.font(.title)
								.onTapGesture {
									self.selectedFacility = facility
							}
						}
					}
					.padding(.vertical)
				}
				.padding(.horizontal)
				
				Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
					if self.favorites.contains(self.resort) {
						self.favorites.remove(self.resort)
					} else {
						self.favorites.add(self.resort)
					}
				}
				.padding()
			}
		}
		.navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
		.alert(item: $selectedFacility) { facility in
			facility.alert
		}
	}
}

struct ResortView_Previews: PreviewProvider {
	static var previews: some View {
		ResortView(resort: Resort.example)
	}
}
