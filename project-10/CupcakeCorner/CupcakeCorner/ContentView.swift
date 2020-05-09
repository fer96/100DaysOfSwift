//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Fernando De La Rosa on 09/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct ContentView: View {
	@ObservedObject var order = Order()
}

// MARK: - View
extension ContentView {
	var body: some View {
		NavigationView {
			Form {
				/// Section basic request
				Section {
					Picker("Select your cake type", selection: $order.type) {
						ForEach(0..<Order.types.count, id: \.self) {
							Text(Order.types[$0])
						}
					}
					
					Stepper(value: $order.quantity, in: 3...20) {
						Text("Number of cakes: \(order.quantity)")
					}
				}
				
				/// Extra section Special Requests
				Section {
					Toggle(isOn: $order.specialRequestEnabled.animation()) {
						Text("Any special requests?")
					}
					
					if order.specialRequestEnabled {
						Toggle(isOn: $order.extraFrosting) {
							Text("Add extra frosting")
						}
						
						Toggle(isOn: $order.addSprinkles) {
							Text("Add extra sprinkles")
						}
					}
				}
				
				/// Next view AddressView
				Section {
					NavigationLink(destination: AddressView(order: order)) {
						Text("Delivery details")
					}
				}
			}
			.navigationBarTitle("Cupcake Corner")
		}
	}
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
