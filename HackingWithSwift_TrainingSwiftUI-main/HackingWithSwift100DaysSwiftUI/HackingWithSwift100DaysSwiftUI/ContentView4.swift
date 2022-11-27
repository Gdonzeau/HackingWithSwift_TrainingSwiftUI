//
//  ContentView4.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 14/05/2022.
//

import SwiftUI

struct ContentView4: View {
    let title = "4"
    var body: some View {
        Button("Find doc") {
            //loadFile()
            test()
        }
    }
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "rtf") {
            print("Document trouvé : \(fileURL)")
        }
    }
    func test() {
        let input = """
a
b
c
"""
        let separates = input.components(separatedBy: "\n")
        guard let separate = separates.randomElement() else {
            print("Nothing")
            return
        }
        print(separate)
        let trimmed = separate.trimmingCharacters(in: .whitespacesAndNewlines)
        print(trimmed)
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
