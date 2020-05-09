//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Fernando De La Rosa on 09/05/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct CheckoutView: View {
	@ObservedObject var order: Order
}

// MARK: - View
extension CheckoutView {
	var body: some View {
		GeometryReader { geo in
			ScrollView {
				VStack {
					Image("cupcakes")
						.resizable()
						.scaledToFit()
						.frame(width: geo.size.width)
					
					Text("Your total is $\(self.order.cost, specifier: "%.2f")")
						.font(.title)
					
					Button("Place Order") {
						// place the order
					}
					.padding()
				}
			}
		}
		.navigationBarTitle("Check out", displayMode: .inline)
	}
}

struct CheckoutView_Previews: PreviewProvider {
	static var previews: some View {
		CheckoutView(order: Order())
	}
}
