//
//  ColoredObjects.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 07/11/2022.
//

import Foundation

class ColoredObjects: ObservableObject {

    static let shared = ColoredObjects()

    @Published var objects = [ColoredObject]()

    init() {
        objects = [ColoredObject(number: 0, color: .purple),
                   ColoredObject(number: 1, color: .green),
                   ColoredObject(number: 2, color: .red)]
    }
}
