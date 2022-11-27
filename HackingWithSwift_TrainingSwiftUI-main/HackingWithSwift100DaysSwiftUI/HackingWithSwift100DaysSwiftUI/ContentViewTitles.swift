//
//  ContentViewTitles.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 12/11/2022.
//

import SwiftUI

struct ContentViewTitles: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Text("Bonjour à tous.")
                }
            }
            .navigationBarTitle("Système d'Entraînement au Tir")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(.green) // This is how you will use it
        }
       
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}

struct NavigationBarModifier: ViewModifier {
    
    var backgroundColor: UIColor?
    
    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
        
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

struct ContentViewTitles_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTitles()
    }
}
