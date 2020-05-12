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
	
	@State private var confirmationMessage = ""
	@State private var showingConfirmation = false
	@State private var titleAlert = ""
}

// MARK: - Logic
extension CheckoutView {
	func placeOrder() {
		guard let encoded = try? JSONEncoder().encode(order) else {
			print("Failed to encode order")
			return
		}
		
		let url = URL(string: "https://reqres.in/api/cupcakes")!
		var request = URLRequest(url: url)
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "POST"
		request.httpBody = encoded
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			guard let data = data else {
				guard let error = error else {
					self.confirmationMessage = "No data no error"
					self.titleAlert = "Error!"
					self.showingConfirmation = true
					return
				}
				self.confirmationMessage = error.localizedDescription
				self.titleAlert = "Error!"
				self.showingConfirmation = true
				return
			}
			
			if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
				self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
				self.showingConfirmation = true
			} else {
				print("Invalid response from server")
			}
		}.resume()
	}
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
						self.placeOrder()
					}
					.padding()
				}
			}
		}
		.navigationBarTitle("Check out", displayMode: .inline)
			
			/// Alert
			.alert(isPresented: $showingConfirmation) {
				Alert(title: Text(titleAlert), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
		}
	}
}

struct CheckoutView_Previews: PreviewProvider {
	static var previews: some View {
		CheckoutView(order: Order())
	}
}
