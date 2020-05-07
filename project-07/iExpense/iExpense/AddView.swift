//
//  AddView.swift
//  iExpense
//
//  Created by Fernando De La Rosa on 28/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct AddView: View {
	@State private var name = ""
	@State private var type = "Personal"
	@State private var amount = ""
	@State private var showingAlert = false
	
	@ObservedObject var expenses: Expenses
	
	@Environment(\.presentationMode) var presentationMode
	
	static let types = ["Business", "Personal"]
	
	var body: some View {
		NavigationView {
			Form {
				TextField("Name", text: $name)
				Picker("Type", selection: $type) {
					ForEach(Self.types, id: \.self) {
						Text($0)
					}
				}
				TextField("Amount", text: $amount).keyboardType(.numberPad)
			}
			.navigationBarTitle("Add new expense")
			.navigationBarItems(trailing:
				Button("Save") {
					if let actualAmount = Int(self.amount) {
						let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
						self.expenses.items.append(item)
						self.presentationMode.wrappedValue.dismiss()
					} else {
						self.showingAlert = true
					}
			})
			
			.alert(isPresented: $showingAlert) {
				Alert(title: Text("Error!"), message: Text("Please, check your data"), dismissButton: .default(Text("Ok"), action: {
					self.showingAlert = false
				}))
			}
		}
	}
}

struct AddView_Previews: PreviewProvider {
	static var previews: some View {
		AddView(expenses: Expenses())
	}
}
