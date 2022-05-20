//
//  ContentViewScrollingGrid.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 19/05/2022.
//

import SwiftUI

struct ContentViewScrollingGrid: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                        .padding()
                        .background(.red)
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct ContentViewScrollingGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewScrollingGrid()
    }
}
