//
//  ContentViewTrackScroll.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 12/10/2022.
//

import SwiftUI

struct ContentViewTrackScroll: View {

    @GestureState private var isDragging: Bool = true
    @State private var canTouchDown = true

    var body: some View {
        //        var move = true
        ScrollView {
            VStack {
                ForEach(0 ..< 10) {_ in
                    rectangleWithTouch

                }
                
                //                Rectangle()
                //                    .frame(width: 300, height: 300)
                //                    .padding()
                //                    .background(.red)
                //                    .cornerRadius(5)
                //                //                .gesture(
                //                //                    DragGesture()
                //                //                        .onChanged { value in
                //                //                            if move {
                //                //                                if value.translation.height > 10 {
                //                //                                    print("Scroll down")
                //                //                                } else if value.translation.height < 10{
                //                //                                    print("Scroll up")
                //                //                                }
                //                //
                //                //                                if value.translation.width > 10 {
                //                //                                    print("Scroll right")
                //                //                                } else if value.translation.width < 10 {
                //                //                                    print("Scroll left")
                //                //                                }
                //                //                                move = false
                //                //
                //                //                            }
                //                //                        }
                //                //                        .onEnded { _ in
                //                //                            move = true
                //                //                        }
                //                //                )
                //                    .gesture(
                //                        DragGesture(minimumDistance: 0)
                //                            .onChanged { _ in
                //                                if canTouchDown {
                //                                    print("Touch down")
                //                                    canTouchDown = false
                //                                }
                //                            }
                //                            .onEnded { _ in
                //                                print("Touch up")
                //                                canTouchDown = true
                //                            }
                //                    )
            }
        }
    }

    var rectangleWithTouch: some View {
        Rectangle()
            .frame(width: 300, height: 300)
            .padding()
            .background(.red)
            .cornerRadius(5)
        //                .gesture(
        //                    DragGesture()
        //                        .onChanged { value in
        //                            if move {
        //                                if value.translation.height > 10 {
        //                                    print("Scroll down")
        //                                } else if value.translation.height < 10{
        //                                    print("Scroll up")
        //                                }
        //
        //                                if value.translation.width > 10 {
        //                                    print("Scroll right")
        //                                } else if value.translation.width < 10 {
        //                                    print("Scroll left")
        //                                }
        //                                move = false
        //
        //                            }
        //                        }
        //                        .onEnded { _ in
        //                            move = true
        //                        }
        //                )
            .gesture(
                DragGesture()
                    .updating($isDragging) { _, _, _ in
                        print("Touch down")
                        //isDragging = true
                    }

                //                    .onChanged { _ in
                //                        if canTouchDown {
                //                            print("Touch down")
                //                            canTouchDown = false
                //                        }
                //                    }
                    .onEnded { _ in
                        print("Touch up")
                        //isDragging = true
                    }
            )
    }
}

struct ContentViewTrackScroll_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTrackScroll()
    }
}
