//
//  AddView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 18/05/2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personnal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personnal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format:.currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Plus de problèmes de contraintes
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
