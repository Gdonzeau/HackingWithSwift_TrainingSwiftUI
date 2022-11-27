//
//  ContentViewScrollingGrid.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 19/05/2022.
//

import SwiftUI

struct ContentViewScrollingGrid: View {
    let title = "16"
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    var body: some View {
        ScrollView {
            //LazyVGrid(columns: layout) {
            VStack {
                ForEach(0..<1000) { number in
             //       GeometryReader { geo in
                    Text("Item \(number)")
                        .padding()
                        .background(.red)
                        .cornerRadius(5)
                        .onAppear{
                            Task {
                                print("Apparaît : \(number)")
                             //   onAppear(number: geo.frame(in: .local).midY)
                            }
                        }
              //  }
                }
            }
        }
    }

    private func onAppear(number: CGFloat) {
        print("Arrivée de \(number).")
    }
}

struct ContentViewScrollingGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewScrollingGrid()
    }
}
