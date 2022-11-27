//
//  Page01.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 16/09/2022.
//

import SwiftUI

struct Page01: View {
    @EnvironmentObject var bag: Bag
    var body: some View {
        VStack(spacing: 20) {
            Text("Bag items = \(bag.items1.count)")
            Text("Bag items = \(bag.items2.count)")
            Button("Bouton") {
                bag.items1.append("Objets")
                bag.items2.append("Objets")
            }
        }
    }
}

struct Page01_Previews: PreviewProvider {
    static var previews: some View {
        Page01()
            .environmentObject(Bag())
    }
}
