//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Fernando De La Rosa on 09/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct AddressView: View {
	@ObservedObject var order: Order
}

// MARK: - View
extension AddressView {
	var body: some View {
		Form {
			/// Input section
			Section {
				TextField("Name", text: $order.name)
				TextField("Street Address", text: $order.streetAddress)
				TextField("City", text: $order.city)
				TextField("Zip", text: $order.zip)
			}
			
			/// Navigation link to final view
			Section {
				NavigationLink(destination: CheckoutView(order: order)) {
					Text("Check out")
				}
			}.disabled(order.hasValidAddress == false)
		}
		.navigationBarTitle("Delivery details", displayMode: .inline)
	}
}

struct AddressView_Previews: PreviewProvider {
	static var previews: some View {
		AddressView(order: Order())
	}
}
