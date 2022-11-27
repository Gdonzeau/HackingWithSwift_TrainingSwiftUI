//
//  ColoredObject.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 07/11/2022.
//

import Foundation
import SwiftUI

class ColoredObject: ObservableObject {
    
    @Published var number: Int
    @Published var color: Color

    init(number: Int, color: Color) {
        self.number = number
        self.color = color
    }
}
