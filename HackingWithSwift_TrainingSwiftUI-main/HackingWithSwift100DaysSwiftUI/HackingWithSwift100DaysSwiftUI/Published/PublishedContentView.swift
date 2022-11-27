//
//  PublishedContentView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 15/09/2022.
//

import SwiftUI

struct PublishedContentView: View {
    @EnvironmentObject var bag: Bag // L'objet apporté du niveau au dessus par .environementObject (nom différent) On peut importer plusieurs objets de ce type
    var body: some View {
        NavigationView {
            VStack (spacing: 20){
                Text("Il est des circonstances où l'homme, quel qu'intelligent qu'il soit obtempère à des raisons qui, bien qu'aléatoires n'en représentent pas moins les intérêts subséquents de valeurs intrinsèques absolues.")
                    .frame(width: 300)

                Text("Items 1 : \(bag.items1.count)")
                Text("Items 2 : \(bag.items2.count)")
                Button("Bouton") {
                    bag.items1.append("Objet")
                    bag.items2.append("Objet")
                    bag.items2.append("Objet")
                }
                NavigationLink {
                    Page01()
                } label: {
                    Text("01")
                        .padding()
                }
                NavigationLink {
                    Page02()
                } label: {
                    Text("02")
                        .padding()
                }
                NavigationLink("Clic") {
                    Page02()
                }
            }
        }
    }
}

struct PublishedContentView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedContentView()
            .environmentObject(Bag())
    }
}
