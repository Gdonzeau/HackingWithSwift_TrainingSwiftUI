//
//  NewBlur02.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 02/11/2022.
//

import SwiftUI

struct NewBlur02: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 500)
                .foregroundColor(.red)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .background(
                    .regularMaterial,
                    in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                )
        }
    }
}

struct NewBlur02_Previews: PreviewProvider {
    static var previews: some View {
        NewBlur02()
    }
}
