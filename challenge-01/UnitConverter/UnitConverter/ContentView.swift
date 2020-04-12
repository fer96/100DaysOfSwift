//
//  ContentView.swift
//  UnitConverter
//
//  Created by Fernando De La Rosa on 11/04/20.
//  Copyright © 2020 Fernando De La Rosa. All rights reserved.
//

import SwiftUI

enum Temperature: String {
  case celsius
  case fahrenheit
  case kelvin
}

struct ContentView: View {
  
  let temperatures: [Temperature] = [.celsius, .fahrenheit, .kelvin]
  
  @State private var inputUnit: Int = 0
  @State private var outputUnit: Int = 0
  @State private var inputValue: String = ""
  
  var input: Double {
    return Double(inputValue) ?? 0.0
  }
  
  var output: Double {
    guard let value = Double(inputValue) else {
      return 0.0
    }
    
    var baseValue: Double = 0.0
    var result: Double = 0.0
    
    switch temperatures[inputUnit] {
    case .celsius:
      baseValue = value + 273.15
    case .fahrenheit:
      baseValue = ((5/9) * (value - 32.0)) + 273.15
    case .kelvin:
      baseValue = value
    }
    
    switch temperatures[outputUnit] {
    case .celsius:
      result = baseValue - 273.15
    case .fahrenheit:
      result = (1.8 * (baseValue - 273.15)) + 32.0
    case .kelvin:
      result = baseValue
    }
    
    return result
  }
  
  var body: some View {
    NavigationView {
      Form {
        /// Input
        Section(header: Text("Input value")) {
          TextField("0.0", text: $inputValue).keyboardType(.decimalPad)
          Picker("Units", selection: $inputUnit) {
            ForEach(0 ..< temperatures.count) {
              Text("\(self.temperatures[$0].rawValue)")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        /// Ouput
        Section(header: Text("Output value")) {
          Picker("Units", selection: $outputUnit) {
            ForEach(0 ..< temperatures.count) {
              Text("\(self.temperatures[$0].rawValue)")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          Text("\(output, specifier: "%.2f")")
        }
      }
    .navigationBarTitle("Unit Converter")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
      ContentView()
  }
}
