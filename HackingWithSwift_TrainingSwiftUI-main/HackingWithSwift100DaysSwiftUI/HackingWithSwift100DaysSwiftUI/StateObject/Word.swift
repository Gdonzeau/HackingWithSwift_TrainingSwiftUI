//
//  Word.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 09/09/2022.
//

import Foundation

class Word: ObservableObject {
    var main: String

    init(main: String) {
        self.main = main
    }
}
