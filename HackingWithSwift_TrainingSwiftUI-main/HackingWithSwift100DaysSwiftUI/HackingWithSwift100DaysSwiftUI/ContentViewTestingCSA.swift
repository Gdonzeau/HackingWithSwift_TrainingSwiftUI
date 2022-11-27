//
//  ContentViewTestingCSA.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 13/09/2022.
//

import SwiftUI

struct ContentViewTestingCSA: View {

    var body: some View {
        ZStack {
            Color(.green)
            VStack(spacing: 50) {

                Text("Bonjour")
                    .padding()
                    .blur(radius: 20)
                ZStack {
                    Color(.darkGray)
                    HStack(alignment: .center, spacing: 2) {
                        Text("Contrôle configuré sur : ")

                        HStack{
                            Image("profile_parental_under12_16x16")
                        }
                        Text(" ans")
                        Text("Encore un test pour voir ce qui se passe si la ligne est trop longue.")
                    }
                }
                .frame(height: 100)

                ZStack {
                    Color(.darkGray)
                    Text("Contrôle configuré sur : ").baselineOffset(2)
                    +
                    Text(imageDouble)
                    +
                    Text(" ans. ").baselineOffset(2)
                    +
                    Text("Encore un test pour voir ce qui se passe si la ligne est trop longue.")
                        .baselineOffset(2)
                }
                .frame(height: 100)
                .blur(radius: 20)
            }
        }
    }

    var imageDouble = Image("profile_parental_under12_16x16")
}

struct ContentViewTestingCSA_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTestingCSA()
    }
}
