//
//  ProgressBarView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 26/11/2022.
//

import SwiftUI

struct ProgressBarView: View {
    
    @State private var value: Double = 0
    @State private var progress: Double = 10
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button {
                        if progress < 100 {
                            progress += 1
                        }
                    } label: {
                        Image(systemName: "plus")
                            .frame(width: 50, height: 50)
                            .background(.red)
                            .cornerRadius(5)
                            .padding()
                    }
                    Button {
                        if progress > 0 {
                            progress -= 1
                        }
                    } label: {
                        Image(systemName: "minus")
                            .frame(width: 50, height: 50)
                            .background(.red)
                            .cornerRadius(5)
                            .padding()
                    }
                }
                ProgressView("Please wait...")
                    .tint(.purple)
                    .foregroundColor(.green)
                    .padding()
                
                ProgressView("Loading...", value: progress, total: 100)
                    .padding()
                
                ProgressView("Loading...", value: progress, total: 100)
                    .progressViewStyle(CustomCircularProgressViewStyle())
                    .padding()
                
                if #available(iOS 15.0, *) {
                    ProgressView("Loading...", value: progress, total: 100)
                        .tint(.gray)
                        .foregroundColor(.blue)
                        .padding()
                } else {
                    ProgressView("Loading...", value: progress, total: 100)
                        .accentColor(.gray)
                        .foregroundColor(.blue)
                        .padding()
                }
                
                ProgressView(value: progress, total: 100)
                    .progressViewStyle(WithBackgroundProgressViewStyle())
                    .padding()
                
                ProgressView("Loading...", value: progress, total: 100)
                    .progressViewStyle(RoundedRectProgressViewStyle())
                    .padding()
            }
        }
    }
}

struct WithBackgroundProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(8)
            .background(Color.gray.opacity(0.25))
            .tint(.red)
            .cornerRadius(8)
    }
}

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 250, height: 28)
                .foregroundColor(.blue)
                .overlay(Color.black.opacity(0.5)).cornerRadius(14)
            
            RoundedRectangle(cornerRadius: 14)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 28)
                .foregroundColor(.yellow)
        }
        .padding()
    }
}

struct CustomCircularProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))//, dash: [10, 5]))
                .rotationEffect(.degrees(-90))
                .frame(width: 200)
            
            if let fractionCompleted = configuration.fractionCompleted {
                Text(fractionCompleted < 1 ?
                        "Completed \(Int((configuration.fractionCompleted ?? 0) * 100))%"
                        : "Done!"
                )
                .fontWeight(.bold)
                .foregroundColor(fractionCompleted < 1 ? .orange : .green)
                .frame(width: 180)
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
