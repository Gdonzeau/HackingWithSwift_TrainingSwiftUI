//
//  ContentViewBlink.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 03/11/2022.
//

import SwiftUI

struct ContentViewBlink: View {
    @State var currentDate = Date()
    @State private var colorChosen = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Rectangle()
            .frame(width: 200, height: 300)
            .foregroundColor(colorChosen ? .green : .red)
            .onReceive(timer) {_ in
                colorChosen.toggle()
            }
    }
}

struct ContentViewBlink_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewBlink()
    }
}
