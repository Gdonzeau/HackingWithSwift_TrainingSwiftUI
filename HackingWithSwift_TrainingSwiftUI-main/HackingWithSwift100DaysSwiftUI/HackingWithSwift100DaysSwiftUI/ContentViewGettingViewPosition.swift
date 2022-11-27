//
//  ContentViewGettingViewPosition.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 28/09/2022.
//

import SwiftUI

struct ContentViewGettingViewPosition: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(1..<20) { num in
//                    GeometryReader { geo in
                        Text("Number") // \(geo.frame(in: .global).midY)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                        //.rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    otherRectangle
//                    }
//                    .frame(width: 800, height: 200, alignment: .center)
                }


            }
        }
    }

    private var otherRectangle: some View {
        VStack() {
            GeometryReader { geo in
                Text("Position : \(Int(geo.frame(in: .global).midY))")
                .padding()
                .background(.blue)
           // Rectangle()
                .frame(width: 400, height: 200)
                .foregroundColor(.white)
            }
        }
        .padding()
        .background(.green)
    }
}

struct RectangleOrange: View {
    var body: some View {
        Rectangle()
            .padding()
            .foregroundColor(.orange)
            .frame(width: 300, height: 200)
    }
}

struct RectangleBleu: View {
    var body: some View {
        Rectangle()
            .padding()
            .foregroundColor(.blue)
    }
}

struct ContentViewGettingViewPosition_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewGettingViewPosition()
    }
}
