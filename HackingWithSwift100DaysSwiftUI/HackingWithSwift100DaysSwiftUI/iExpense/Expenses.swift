//
//  Expenses.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 18/05/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Item")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Item") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
