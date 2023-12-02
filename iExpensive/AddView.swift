//
//  AddView.swift
//  iExpensive
//
//  Created by Neto Lobo on 18/10/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses : Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Business"
    @State private var amount = 0.0
    @State private var currency = "USD"
    
    
    let currencies = ["USD", "EUR", "JPY", "GBP", "AUD", "CAD", "CHF", "CNY", "SEK", "NZD", "KRW", "SGD", "NOK", "MXN", "INR", "BRL", "ZAR", "HKD", "RUB"]


    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Currency", selection: $currency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    dismiss()
                    let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency)
                    expenses.items.append(item)
                    
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
