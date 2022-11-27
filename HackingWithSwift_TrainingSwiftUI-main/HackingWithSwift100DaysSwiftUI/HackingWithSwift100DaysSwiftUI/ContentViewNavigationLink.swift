//
//  ContentViewNavigationLink.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 19/05/2022.
//

import SwiftUI

struct ContentViewNavigationLink: View {
    let title = "14"
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)") // Marche aussi avec les différents ContentView ;)
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentViewNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNavigationLink()
    }
}
