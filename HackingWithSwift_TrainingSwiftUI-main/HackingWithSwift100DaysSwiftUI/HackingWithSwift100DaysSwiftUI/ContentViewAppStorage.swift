//
//  ContentViewAppStorage.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 03/11/2022.
//

import SwiftUI

struct ContentViewAppStorage: View {
    @State var number = 0
    @AppStorage("Number") var numberSaved = 0

    @State private var scale = 1.0

    var body: some View {
        VStack {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .animation(.easeInOut.repeatCount(5).speed(1.0))

        Button("\(numberSaved)") {
            numberSaved += 1
        }
        .padding()
        .background(.gray)
        .scaleEffect(scale)
        .animation(.linear(duration: 1), value: scale)
//        .animation(
//            .easeInOut(duration: 1)
//                    .repeatCount(3, autoreverses: true),
//            value: 1.0)
    }
    }
}

struct ContentViewAppStorage_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewAppStorage()
    }
}
