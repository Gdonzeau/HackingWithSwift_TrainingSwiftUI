//
//  MainContentView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 22/05/2022.
//

import SwiftUI

struct Apps {
    var id = UUID()
    /*
    var ViewToApp:[View] = [
        ContentView(),
        ContentView2(),
        ContentView3(),
        ContentView4(),
        ContentView5(),
        ContentView6(),
        ContentViewAnimation(),
        ContentViewAnimation2(),
        Bluetooth(),
        ContentViewSheet(),
        ContentViewOnDelete(),
        ContentViewImage(),
        ContentViewScrollView(),
        ContentViewNavigationLink(),
        ContentViewHierarchyData(),
        ContentViewScrollingGrid(),
        ContentViewMoonShot(),
        ContentViewiExpense()
    ]
    */
    let title = ""
}

struct MainContentView: View {
    var viewToApp:[Any] = [
        ContentView(),
        ContentView2(),
        ContentView3.self,
        ContentView4.self,
        ContentView5.self,
        ContentView6.self,
        ContentViewAnimation.self,
        ContentViewAnimation2.self,
        Bluetooth.self,
        ContentViewSheet.self,
        ContentViewOnDelete.self,
        ContentViewImage.self,
        ContentViewScrollView.self,
        ContentViewNavigationLink.self,
        ContentViewHierarchyData.self,
        ContentViewScrollingGrid.self,
        ContentViewMoonShot.self,
        ContentViewiExpense.self
    ]
    //let apps = Apps()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0..<18) { index in
                        let destinationView:AnyView = viewToApp[index] as? AnyView ?? AnyView(ContentView())
                        
                        NavigationLink {
                            //AnyView( destinationView)
                            destinationView
                            //ContentView4()
                        } label: {
                            Text("Application n°1")
                            Text("\(index)")
                        }
                        
                    }
                }
            }
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
