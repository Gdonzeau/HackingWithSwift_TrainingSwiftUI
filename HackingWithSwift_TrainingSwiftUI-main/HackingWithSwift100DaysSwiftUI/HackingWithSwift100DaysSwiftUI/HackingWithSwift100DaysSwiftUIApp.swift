//
//  HackingWithSwift100DaysSwiftUIApp.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 06/05/2022.
//

import SwiftUI
import AVFoundation

@main
struct HackingWithSwift100DaysSwiftUIApp: App {
    @StateObject var bag = Bag() // Pour le dossier Published
    let allViews = [ProgressBarView(), ContentView()] as [any View]
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrollView {
                    VStack {
                        //     NavigationView {
                        NavigationLink {
                            ChronometerView()
                        } label: {
                            Text("Chrono")
                                .padding()
                        }
                        NavigationLink {
                            ProgressBarView()
                        } label: {
                            Text("Progress bar")
                                .padding()
                        }
                        NavigationLink {
                            ContentViewTitles()
                        } label: {
                            Text("Titles")
                                .padding()
                        }
                        NavigationLink {
                            ContentViewActualizeView()
                        } label: {
                            Text("Actualize view")
                                .padding()
                        }
                        NavigationLink {
                            ContentViewBlink()
                        } label: {
                            Text("Blink")
                                .padding()
                        }
                        NavigationLink {
                            ContentViewAppStorage()
                        } label: {
                            Text("App storage")
                                .padding()
                        }
                        Button {
                            toggleTorch(on: true)
                        } label: {
                            Text("Light ON")
                                .padding()
                        }
                        Button {
                            toggleTorch(on: false)
                        } label: {
                            Text("Light OFF")
                                .padding()
                        }
                    }
                    // Spacer()
                }
                //  .padding()
            }
            
            //Bluetooth()
            //ContentView() // Resto
            //ContentView2() // Drapeaux
            //ContentView3() // Coffee and Sleep
            //ContentView4() // Bundles et autres
            //ContentView5() // Strings
            //ContentViewAnimation() // Animations, ben oui
            //ContentViewAnimation2() // Animations, suite
            //ContentView6() //@Published et @StateObject
            //ContentViewSheet() // sheet
            //ContentViewOnDelete() // Ajout et suppression de lignes (UIKit : cell) dans une liste (UIKit : TableView)
            //ContentViewiExpense() // Project iExpense
            //ContentViewImage()
            //ContentViewScrollView()
            //ContentViewNavigationLink()
            //ContentViewHierarchyData()
            //ContentViewScrollingGrid()
            //ContentViewSpecificDataCodable()
            //ContentViewMoonShot()
            //MainContentView()
            //ContentViewDrawing()
            //TestTifo()
            //ContentViewTabView()
            //ContentViewTabView2()
            //ContentViewTabBar3()
            //ContentViewNotifications()
            //StateObjectContentView()
            //EnvironmentContentView()
            //ContentViewTestingCSA()
            //PublishedContentView().environmentObject(bag) // On transmet bag
            //DemoScrollViewOffsetView() // Position ScrollView
            //GeometryReaderTrain()
            //ContentViewTestEnumerated()
            //ContentViewGettingViewPosition()
            //ContentViewTrackScroll()
            //ContentViewNewBlurEffect()
            //ContentViewBlurTest()
            //ContentViewAppStorage()
            //ContentViewBlink()
            //ContentViewActualizeView()
            //ContentViewTitles()
            //ProgressBarView()
            //ChronometerView()
        }
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                device.torchMode = on ? .on : .off
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
        
    }
}
