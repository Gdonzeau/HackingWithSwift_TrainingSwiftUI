//
//  PageView01.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 09/09/2022.
//

import SwiftUI

struct PageView01: View {

    @ObservedObject var word: Word
    //@StateObject var word = Word(main: "")
    //En cas de deuxième instance @StateObject, les autres instances ObservedObject sont ajustées aussi. StateObject s'ajuste si on clique dessus.
    var body: some View {
        TextField("Word", text: $word.main)
        Text("\(word.main)")
    }
}

struct PageView01_Previews: PreviewProvider {

    static var previews: some View {
        PageView01(word: Word(main: "Test"))
    }
}
