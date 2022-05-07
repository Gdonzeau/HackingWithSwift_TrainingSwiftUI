//
//  ContentView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 06/05/2022.
//

import SwiftUI

struct ContentView: View {
    let persons = ["Jean", "Pierre", "Paul", "Jacques"]
    var body: some View {
        Form {
            ForEach (0..<100) {
                Text("Row: \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
