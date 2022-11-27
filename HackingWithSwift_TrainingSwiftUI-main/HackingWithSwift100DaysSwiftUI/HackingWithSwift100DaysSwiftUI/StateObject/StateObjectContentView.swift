//
//  StateObjectContentView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 09/09/2022.
//

import SwiftUI

struct StateObjectContentView: View {
// StateObject est utilisé pour une classe ObservableObject
// Les instances dans les autres View sous forme @ObservableObject sont mises à jour.
    @StateObject var word = Word(main: "Ici")
    
    var body: some View {
        NavigationView {

            VStack(spacing: 20) {
                TextField("Word", text: $word.main)
                    .padding()
                    .frame(alignment: .center)
                    .background(.gray)

                NavigationLink {
                    PageView01(word: word)
                    // Lien établi à la création de la page.
                    //Text("Detail View")
                } label: {
                    Text("01")
                        .padding()
                        .background(.red)
                }
                NavigationLink {
                    PageView02(word: word)
                    //Text("Detail View")
                } label: {
                    Text("02")
                        .padding()
                        .background(.green)
                }
                NavigationLink {
                    PageView03(word: word)
                    //Text("Detail View")
                } label: {
                    Text("03")
                        .padding()
                        .background(.brown)
                }
            }
        }
    }
}

struct StateObjectContentView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectContentView()
    }
}
