//
//  ColoredObjectView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 07/11/2022.
//

import SwiftUI

struct ColoredObjectView: View {
    var color: Color
    var body: some View {
        Rectangle()
            .frame(width: 60, height: 90)
            .cornerRadius(5)
            .foregroundColor(color)
            .onAppear(perform: onAppear)
    }

    init(color: Color) {
        self.color = color
    }

    func onAppear() {
        if color == .red {
            touched()
        }
    }

    func touched() {
        print("Touché")
    }
}

struct ColoredObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredObjectView(color: .green)
    }
}
