//
//  ExpenseItem.swift
//  iExpensive
//
//  Created by Neto Lobo on 18/10/23.
//

import Foundation

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}
