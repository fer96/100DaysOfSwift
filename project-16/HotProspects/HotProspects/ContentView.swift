//
//  ContentView.swift
//  HotProspects
//
//  Created by Fernando De La Rosa on 02/06/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
	var value = 0 {
		willSet {
			objectWillChange.send()
		}
	}
	
	init() {
		for i in 1...10 {
			DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
				self.value += 1
			}
		}
	}
}

struct ContentView: View {
	@ObservedObject var updater = DelayedUpdater()
	
	var body: some View {
		Image("example")
			.interpolation(.none)
    .resizable()
    .scaledToFit()
    .frame(maxHeight: .infinity)
    .background(Color.black)
    .edgesIgnoringSafeArea(.all)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
