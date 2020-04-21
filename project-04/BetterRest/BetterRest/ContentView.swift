//
//  ContentView.swift
//  BetterRest
//
//  Created by Fernando De La Rosa on 19/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var wakeUp = defaultWakeTime
	@State private var sleepAmount = 8.0
	@State private var coffeAmount = 1
	@State private var alertTitle = ""
	@State private var alertMessage = ""
	
	static var defaultWakeTime: Date {
		var components = DateComponents()
		components.hour = 7
		components.minute = 0
		return Calendar.current.date(from: components) ?? Date()
	}
	
	var titleTime: String {
		guard let _ = calculateBedTime() else {
			return "Sorry, there was a problem calculating your bedtime"
		}
		return "Your ideal bedtime is"
	}
	
	var messageTime: String {
		guard let sleepTime = calculateBedTime() else {
			return ""
		}
		
		let formatter = DateFormatter()
		formatter.timeStyle = .short
		
		return formatter.string(from: sleepTime)
	}
	
	var body: some View {
		NavigationView {
			Form {
				/// Wake up
				Section(header: Text("When do you want to wake up?")) {
					DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
					.labelsHidden()
					.datePickerStyle(WheelDatePickerStyle())
				}

				/// Sleep hours
				Section(header: Text("Desired amount of sleep")) {
					Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
						Text("\(sleepAmount, specifier: "%g") hours")
					}
				}
				
				/// Cups of coffe
				Section(header: Text("Daily coffee intake")) {
					Picker("How many cups of coffee do you drink at day?", selection: $coffeAmount) {
						ForEach(1..<21) { cup in
							if cup == 1 {
								Text("1 cup")
							} else  {
								Text("\(cup) cups")
							}
						}
					}
					.pickerStyle(WheelPickerStyle())
					.labelsHidden()
				}
				
				/// Calculate bedtime
				Section(header: Text(titleTime)) {
					Text(messageTime)
				}
			}

			/// Navigation bar configutarion
				.navigationBarTitle("Better Rest", displayMode: .inline)
		}
	}
	
	// MARK: - Methods
	func calculateBedTime() -> Date? {
		let model: SleepCalculator = SleepCalculator()
		
		let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
		let hour = (components.hour ?? 0) * 60 * 60
		let minute = (components.minute ?? 0) * 60
		
		do {
			let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
			let sleepTime = wakeUp - prediction.actualSleep
			
			return sleepTime
		} catch {
			return nil
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
			ContentView()
	}
}
