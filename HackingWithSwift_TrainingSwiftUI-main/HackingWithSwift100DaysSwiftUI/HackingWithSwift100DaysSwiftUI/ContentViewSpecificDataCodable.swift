//
//  ContentViewSpecificDataCodable.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 19/05/2022.
//

import SwiftUI

struct ContentViewSpecificDataCodable: View {
    let title = "17"
    var body: some View {
        Button("Test Fatal Error") {
            print("ok")
        }
        .padding()
        .background(.red)
    }
}

struct ContentViewSpecificDataCodable_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewSpecificDataCodable()
    }
}
