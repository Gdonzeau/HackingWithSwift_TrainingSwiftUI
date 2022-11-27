//
//  ContentView6.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 16/05/2022.
//

import SwiftUI

class Test: ObservableObject {
    @Published var name1 = "Test1"
    @Published var name2 = "Test2"
}

struct ContentView6: View {
    let title = "6"
    @StateObject var test = Test()
    var body: some View {
        VStack {
            Text("Your name is \(test.name1) \(test.name2)")
            TextField("First name", text: $test.name1)
            TextField("Last name", text: $test.name2)
        }
    }
}

struct ContentView6_Previews: PreviewProvider {
    static var previews: some View {
        ContentView6()
    }
}
