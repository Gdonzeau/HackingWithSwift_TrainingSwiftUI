//
//  NewBlur01.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 02/11/2022.
//

import SwiftUI

struct NewBlur01: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 500, height: 300)
                .foregroundColor(.green)

            Image("Example")
                .frame(width: 400, height: 250)

            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .background(
                    .regularMaterial,
                    in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                )
        }
    }
}

struct NewBlur01_Previews: PreviewProvider {
    static var previews: some View {
        NewBlur01()
    }
}
