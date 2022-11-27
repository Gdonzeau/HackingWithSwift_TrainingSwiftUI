//
//  ChronometerView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 26/11/2022.
//

import SwiftUI

struct ChronometerView: View {
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var timeRemaining = 10
    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var progress:Double = 0
    let timer3 = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let diameter: Double = 100
    
    var body: some View {
        Text("\(currentDate)")
            .onReceive(timer) { input in
                currentDate = input
            }
            .padding()
        
        Text("\(timeRemaining)")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
            .padding()
        ZStack {
            ProgressView("Loading...", value: progress, total: 100)
                .progressViewStyle(CustomCircularProgressViewStyle())
                .padding()
                .onReceive(timer3) { _ in
                    if progress < 100 {
                        progress += 0.1
                    }
                }
            HStack {
                Rectangle()
                    .frame(width: 60,height: 1)
                    .foregroundColor(.orange)
                Rectangle()
                    .frame(width: 140,height: 1)
                    .foregroundColor(.white)
            }
            .rotationEffect(Angle(degrees: convertTimeIntoAngle(time: progress) - 90))
        }
        .padding()
        
        clock
    }
    
    var clock: some View {
        ZStack {
            Circle()
                .stroke(Color.white, style: StrokeStyle(lineWidth: 2, dash: [6, 30]))
                .frame(height: diameter)
                
            Text("")
        }
        .padding()
    }
    
    var perimeter: Double {
        diameter * .pi
    }
    
    var dotSize: Double {
        perimeter/12
    }
    
    func convertTimeIntoAngle(time: Double) -> Double {
        let angle: Double = time * 6
        return angle
    }
}


struct ChronometerView_Previews: PreviewProvider {
    static var previews: some View {
        ChronometerView()
    }
}
