//
//  ContentView.swift
//  Convert
//
//  Created by Eric Xu on 1/25/24.
//  Copyright © 2024 Eric Xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //State Variables for Length:
    @State private var length = 0.0
    @State private var inputLengthUnit = "Meter"
    @State private var outputLengthUnit = "Meter"
    
    //Other Temperature Variables:
    let inputLengthUnits = ["Meter", "Kilometer", "Mile", "Feet", "Inch", "Yard"]
    let outputLengthUnits = ["Meter", "Kilometer", "Mile", "Feet", "Inch", "Yard"]
    
    //Advanced Length Variables:
    var inputLengthInMeters: Double {
        if inputLengthUnit == "Meter" {
            return length
        }
        else if inputLengthUnit == "Kilometer" {
            return length * 1000.0
        }
        else if inputLengthUnit == "Mile"{
            return (length * 5280) * 0.3048
        }
        else if inputLengthUnit == "Feet" {
            return length * 0.3048
        }
        else if inputLengthUnit == "Inch" {
            return (length / 12) * 0.3048
        }
        else { //Yard
            return (length * 3) * 0.3048
        }
    }
    
    var outputLength: Double {
        if outputLengthUnit == "Meter" {
            return inputLengthInMeters
        }
        else if outputLengthUnit == "Kilometer" {
            return inputLengthInMeters / 1000.0
        }
        else if outputLengthUnit == "Mile"{
            return (inputLengthInMeters) * 0.000621371
        }
        else if outputLengthUnit == "Feet" {
            return (inputLengthInMeters) * 3.28084
        }
        else if outputLengthUnit == "Inch" {
            return (inputLengthInMeters * 3.28084) * 12
        }
        else { //Yard
            return (inputLengthInMeters * 3.28084) / 3
        }
    }
    
    
    //State Variables for Temperature:
    @State private var temperature = 0.0
    @State private var inputTemperatureUnit = "Celsius"
    @State private var outputTemperatureUnit = "Celsius"

    //Other Temperature Variables:
    let inputTemperatureUnits = ["Kelvin", "Celsius", "Fahrenheit"]
    let outputTemperatureUnits = ["Kelvin", "Celsius", "Fahrenheit"]
    
    //Advanced Temperature Variables:
    var inputTempInKelvin: Double {
        if inputTemperatureUnit == "Kelvin" {
            return temperature
        }
        else if inputTemperatureUnit == "Celsius" {
            return temperature + 273.15
        }
        else {
            return (temperature - 32) * (5/9) + 273.15
        }
    }
    
    var outputTemp: Double {
        if outputTemperatureUnit == "Kelvin" {
            return inputTempInKelvin
        }
        else if outputTemperatureUnit == "Celsius" {
            return inputTempInKelvin - 273.15
        }
        else {
            return ((inputTempInKelvin - 273.15) * (Double(9)/5)) + 32
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Length") {
                    Picker("Choose Input Length Unit", selection: $inputLengthUnit) {
                        ForEach(inputLengthUnits, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.menu)
                    }
                    TextField("Enter Input Length", value: $length, format: .number)
                    Picker("Choose Output Length Unit", selection: $outputLengthUnit) {
                        ForEach(outputLengthUnits, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.menu)
                    }
                    
                    Text("Converted Length: \(outputLength)")
                }
                Section("Temperature") {
                    Picker("Choose Input Temperature Unit", selection: $inputTemperatureUnit) {
                        ForEach(inputTemperatureUnits, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.menu)
                    }
                    TextField("Enter Input Temperature", value: $temperature, format: .number)
                    Picker("Choose Output Temperature Unit", selection: $outputTemperatureUnit) {
                        ForEach(outputTemperatureUnits, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.menu)
                    }
                    
                    Text("Converted Temperature: \(outputTemp)")
                }
            }
            .navigationTitle("QuickConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
