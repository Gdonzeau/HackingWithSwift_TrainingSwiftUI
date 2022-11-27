//
//  ContentViewTabView2.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 25/08/2022.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        Rectangle()
            .frame(width: .infinity, height: 2)
            .foregroundColor(.green)
    }
}

struct ContentViewTabView2: View {
    let tabBarHeight = 120.0
    var body: some View {
//        ZStack {
            //     Color.green
//            RectangleView()
//                .frame(maxWidth: .infinity)
//
            TabView {
                Text("Home Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .frame(height: tabBarHeight, alignment: .bottom)
                
                Text("Bookmark Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "bookmark.circle.fill")
                        Text("Bookmark")
                    }
                    .frame(height: tabBarHeight, alignment: .bottom)
                
                Text("Video Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "video.circle.fill")
                        Text("Video")
                    }
                    .frame(height: tabBarHeight, alignment: .bottom)
                
                Text("Profile Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                    .frame(height: tabBarHeight, alignment: .bottom)
            }
            .opacity(1)
            .onAppear() {
                // UITabBar.appearance().barTintColor = .blue
                UITabBar.appearance().backgroundColor = .lightGray
                //UITabBar.appearance().unselectedItemTintColor = .green
                UITabBar.appearance().shadowImage = UIImage()
                
            }
            .accentColor(.red)
        Rectangle()
            .frame(width: 20, height: 2)
            .foregroundColor(.red)
//        }
    }
}

struct ContentViewTabView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTabView2()
    }
}
