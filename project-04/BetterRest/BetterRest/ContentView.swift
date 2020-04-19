//
//  ContentView.swift
//  BetterRest
//
//  Created by Fernando De La Rosa on 19/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var wakeUp = Date()
	
	var body: some View {
		Form {
			DatePicker("Please enter a date", selection: $wakeUp)
    }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
			ContentView()
	}
}
