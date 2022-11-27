//
//  ContentViewOnDelete.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 16/05/2022.
//

import SwiftUI

struct ContentViewOnDelete: View {
    let title = "11"
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
             
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Plus de problèmes de contraintes
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentViewOnDelete_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewOnDelete()
    }
}
