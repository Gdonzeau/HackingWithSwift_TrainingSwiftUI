//
//  ContentViewTabBar3.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 25/08/2022.
//

import SwiftUI

struct ContentViewTabBar3: View {
    var body: some View {
        TabView {
            LazyVStack(spacing: 0) {
                ScrollView {
                    ForEach(0 ..< 40) { item in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange)
                            .frame(height: 44)
                            .padding()
                            .onAppear {
                                print(item)
                            }
                    }
                }

                //                Divider()
                //                    .background(Color.blue.opacity(0.2))
                Rectangle()
                    .frame(height: 2, alignment: .top)
                    .foregroundColor(.red)
            }
            .font(.title2)
            .tabItem {
                Image(systemName: "star")
                Text("Tab 1")
            }
            VStack {
                ScrollView {
                    Text("Tab 2")
                }
                //Spacer()
                Rectangle()
                    .frame(height: 2, alignment: .bottom)
                    .foregroundColor(.red)
            }
            .tabItem {
                Image(systemName: "moon")
                Text("Tab 2")
            }

            ZStack {
                VStack(spacing: 30) {
                    Text("Bonjour")
                    Text("Rebonjour")
                    Text("Et encore bonjour")
                }
                //UIBlurEffect()
                BlurView(style: .systemThickMaterial)
                    .frame(width: 100, height: 100)
//                Color(.blue)
//                    .opacity(0.4)
                    //.blur(radius: 4)
            }
            .tabItem {
                Image(systemName: "clock")
                Text("Clock")
            }
        }
    }
}

struct BlurView: UIViewRepresentable {

    let style: UIBlurEffect.Style

    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }

    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {

    }

}


struct ContentViewTabBar3_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTabBar3()
    }
}
