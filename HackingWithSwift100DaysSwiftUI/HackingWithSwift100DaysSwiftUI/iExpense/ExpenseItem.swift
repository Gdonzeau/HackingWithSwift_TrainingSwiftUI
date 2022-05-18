//
//  ExpenseItem.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 18/05/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
