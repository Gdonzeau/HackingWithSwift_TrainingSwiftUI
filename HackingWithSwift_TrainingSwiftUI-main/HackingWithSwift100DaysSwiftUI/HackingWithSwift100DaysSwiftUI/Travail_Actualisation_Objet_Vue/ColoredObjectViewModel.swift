//
//  ColoredObjectViewModel.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 07/11/2022.
//

import Foundation
import SwiftUI

class ColoredObjectViewModel: ObservableObject {

    @Published var color: Color
    @Published var number: Int

    init(color: Color, number: Int) {
        self.number = number
        self.color = color
    }
}
