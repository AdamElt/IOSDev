//
//  Tips.swift
//  IOSDev
//
//  Created by Adam El-Telbani on 2/26/25.
//


import SwiftUI

struct Tips: View {
    @State private var billAmount = ""
    @State private var tipPercentage = 15.0
    @State private var numberOfPeople = 2
    
    private let tipPercentages = [10.0, 15.0, 18.0, 20.0, 25.0]
    
    private var totalAmount: Double {
        let bill = Double(billAmount) ?? 0
        let tipValue = bill * tipPercentage / 100
        return bill + tipValue
    }
    
    private var totalPerPerson: Double {
        totalAmount / Double(numberOfPeople)
    }
    
    private var tipAmount: Double {
        let bill = Double(billAmount) ?? 0
        return bill * tipPercentage / 100
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Bill Amount")) {
                    TextField("Amount", text: $billAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Tip Percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) { percentage in
                            Text("\(Int(percentage))%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Number of People")) {
                    Stepper("\(numberOfPeople) people", value: $numberOfPeople, in: 1...100)
                }
                
                Section(header: Text("Amount Details")) {
                    HStack {
                        Text("Tip amount")
                        Spacer()
                        Text("$\(tipAmount, specifier: "%.2f")")
                            .foregroundColor(.green)
                    }
                    
                    HStack {
                        Text("Total with tip")
                        Spacer()
                        Text("$\(totalAmount, specifier: "%.2f")")
                            .foregroundColor(.blue)
                    }
                    
                    HStack {
                        Text("Amount per person")
                        Spacer()
                        Text("$\(totalPerPerson, specifier: "%.2f")")
                            .foregroundColor(.purple)
                    }
                }
            }
            .navigationTitle("Tip Calculator")
        }
    }
}

struct Tips_Previews: PreviewProvider {
    static var previews: some View {
        Tips()
    }
}
