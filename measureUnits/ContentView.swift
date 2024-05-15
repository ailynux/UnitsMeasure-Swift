//
//  ContentView.swift
//  measureUnits
//
//  Created by Ailyn Diaz on 2/20/24.
//


import SwiftUI
import Foundation

struct ContentView: View {
    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]

    @State private var inputValue = ""
    @State private var inputUnitIndex = 0
    @State private var outputUnitIndex = 0

    var convertedValue: Double {
        guard let inputValueDouble = Double(inputValue) else { return 0 }

        let conversionFactors: [Double] = [1, 1000, 0.3048, 0.9144, 1609.34]
        let inputFactor = conversionFactors[inputUnitIndex]
        let outputFactor = conversionFactors[outputUnitIndex]

        return inputValueDouble * inputFactor / outputFactor
    }

    var body: some View {
        VStack {
            Text("Units of Measure")
                           .font(.largeTitle)
                           .fontWeight(.bold)
                           .padding(.top, 30)
            Spacer()
                           .frame(height: 100)
            //end of title

            //input
            Text("Input")
                .font(.title)
                .foregroundColor(.purple)
                .padding(.top, 10)

            Picker("Input Unit", selection: $inputUnitIndex) {
                ForEach(Array(0..<units.count), id: \.self) { index in
                    Text(self.units[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            //user enters
            TextField("Enter value", text: $inputValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            //output
            Text("Output")
                .font(.title)
                .foregroundColor(.green)
                .padding(.top, 10)
            Picker("Output Unit", selection: $outputUnitIndex) {
                ForEach(Array(0..<units.count), id: \.self) { index in
                    Text(self.units[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            //result
            Text("Result: \(convertedValue, specifier: "%.2f")")
                .font(.title)
                .padding()

            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
