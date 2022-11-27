//
//  ContentViewDrawing.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 24/05/2022.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x:rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    
    var insetAmount = 0.0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
}

struct Flower: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            let rotatedPetal = originalPetal.applying(position)
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct ContentViewDrawing: View {
    
    let choices = ["Triangle", "Arc", "Flower"]
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    @State private var triangleOn = false
    @State private var arcOn = false
    @State private var flowerOn = true
    
    @State private var finalChoice = "Triangle" {
        didSet {
            switch finalChoice {
            case "Triangle":
                triangleOn = true
                arcOn = false
                flowerOn = false
                
            case "Flower":
                triangleOn = false
                arcOn = false
                flowerOn = true
                
            case "Arc":
                triangleOn = false
                arcOn = true
                flowerOn = false
                
            default:
                triangleOn = true
                arcOn = false
                flowerOn = false
            }
            
        }
    }
    
    
    var body: some View {
        VStack {
            
            Picker("Tip percentage", selection: $finalChoice) {
                ForEach(choices, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
             
            if triangleOn {
                Triangle()
                    .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .frame(width: 300, height: 300)
            } else if arcOn {
                Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                    .strokeBorder(.blue, lineWidth: 10)
                    .frame(width: 300, height: 300)
            } else if flowerOn {
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                //.stroke(.red, lineWidth: 1)
                    .fill(.red, style: FillStyle(eoFill: true))
            }
            
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40 ... 40)
                .padding([.horizontal, .bottom])
            Text("Width")
            Slider(value: $petalWidth, in: 0 ... 100)
                .padding(.horizontal)
        }
    }
    
}

struct ContentViewDrawing_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewDrawing()
    }
}
