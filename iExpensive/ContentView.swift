//
//  ContentView.swift
//  iExpensive
//
//  Created by Neto Lobo on 18/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var shoingAddExpense = false
    
    var body: some View {
        NavigationView {
            VStack {
                Section("Business") {
                    List {
                        ForEach(expenses.items) { item in
                            
                            if item.type == "Business" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        
                                        Text(item.type)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(item.amount, format: .currency(code: item.currency))
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                Section("Personal") {
                    List {
                        ForEach(expenses.items) { item in
                            
                            if item.type == "Personal" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                            .accessibilityLabel(item.name)
                                        
                                        Text(item.type)
                                        accessibilityHint(item.type)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(item.amount, format: .currency(code: item.currency))
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            }
            
            
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    shoingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $shoingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
