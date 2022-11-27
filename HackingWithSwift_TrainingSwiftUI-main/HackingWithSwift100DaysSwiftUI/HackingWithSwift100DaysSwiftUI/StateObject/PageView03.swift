//
//  PageView03.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 09/09/2022.
//

import SwiftUI

struct PageView03: View {
    @ObservedObject var word: Word

    var body: some View {
        Text("\(word.main)")
    }
}

struct PageView03_Previews: PreviewProvider {
    static var previews: some View {
        PageView03(word: Word(main: "Test"))
    }
}
