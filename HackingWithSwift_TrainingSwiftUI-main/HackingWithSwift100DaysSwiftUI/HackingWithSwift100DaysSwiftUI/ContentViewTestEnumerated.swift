//
//  ContentViewTestEnumerated.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 28/09/2022.
//

import SwiftUI

struct ContentViewTestEnumerated: View {
    let tableau: [String] = ["Chien", "Chat", "Perroquet", "Souris", "Moineau", "Cheval", "Chèvre"]
    var body: some View {
        ScrollView {
            ForEach(Array(tableau.enumerated()), id:\.offset) { (index, animal) in
                Text("\(animal) est au rang \(index)")
                    .padding()
            }
        }
    }
}

struct ContentViewTestEnumerated_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTestEnumerated()
    }
}
