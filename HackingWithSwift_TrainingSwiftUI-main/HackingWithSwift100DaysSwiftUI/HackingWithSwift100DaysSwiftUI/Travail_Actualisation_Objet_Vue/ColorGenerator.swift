//
//  ColorGenerator.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 07/11/2022.
//

import Foundation
import SwiftUI

class ColorGenerator {
    static let shared = ColorGenerator()

    var coloredObjects = ColoredObjects.shared

    var timer: Timer?

    init() {}

    @Published var messageColor: String = ""

    func generateColor() -> Color {
        let randomNumber = Int.random(in: 1 ... 5)

        switch randomNumber {
        case 1:
            return .red
        case 2:
            return .green
        case 3:
            return .blue
        case 4:
            return .brown
        case 5:
            return .purple
        default:
            return .black
        }
    }

    func changeColorRandomObject() {
        let index = Int.random(in: 0 ..< coloredObjects.objects.count)
        let color = generateColor()
        let object = ColoredObject(number: index, color: color)
        print("*****/ Objet n°:\(object.number) a la couleur \(object.color)")

        for object in coloredObjects.objects {
            print("Objet n°:\(object.number) a la couleur \(object.color)")
        }
        if let newIndex = coloredObjects.objects.firstIndex(where: ({$0.number == object.number })) {
            print("Objet modifié.")
            coloredObjects.objects[newIndex] = object
        }
        for object in coloredObjects.objects {
            print("Objet n°:\(object.number) a la couleur \(object.color)")
        }
    }
}
