//
//  ContentViewTabView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 24/08/2022.
//

import SwiftUI

struct ContentViewTabView: View {
//    init() {
//        UITabBar.appearance().backgroundColor = .blue
//        UITabBar.appearance().unselectedItemTintColor = .yellow
//    }
    
    var body: some View {
        TabView() {
            Text("First")
                .tabItem {
                    Image("auvio_icon_direct")
                        .renderingMode(.template)
                    Text("Premier")
                }
            Text("Second")
                .tabItem {
                    Image("auvio_icon_kids")
                        .renderingMode(.template)
                    Text("Deuxième")
                }
            Text("Third")
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

struct ContentViewTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTabView()
    }
}

extension ContentViewTabView {
    func start() {
         UITabBar.appearance().backgroundColor = .darkGray
         UITabBar.appearance().unselectedItemTintColor = .yellow
       // UITabBar.appearance().items.color = .yellow
        // UITabBar.appearance().barTintColor = .green
    }
}
