//
//  ContentViewNewBlurEffect.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 02/11/2022.
//

import SwiftUI

struct ContentViewNewBlurEffect: View {
    var body: some View {
        TabView() {
            NewBlur01()
                .tabItem {
                    Image("auvio_icon_direct")
                        .renderingMode(.template)
                    Text("Premier")
                }
            NewBlur02()
                .tabItem {
                    Image("auvio_icon_kids")
                        .renderingMode(.template)
                    Text("Deuxième")
                }
            NewBlur03()
                .tabItem {
                    Image("auvio_icon_podcast")
                        .renderingMode(.template)
                    Text("Troisième")
                }
        }
        .onAppear(perform: start)
        .accentColor(.red)
    }
}

extension ContentViewNewBlurEffect {
    func start() {
         UITabBar.appearance().backgroundColor = .darkGray
         UITabBar.appearance().unselectedItemTintColor = .yellow
    }
}

struct ContentViewNewBlurEffect_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNewBlurEffect()
    }
}
