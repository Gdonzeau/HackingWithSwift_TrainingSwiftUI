//
//  ContentViewImage.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 18/05/2022.
//

import SwiftUI

struct ContentViewImage: View {
    let title = "12"
    var body: some View {
        
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 100, height: 100, alignment: .top)
                    .foregroundColor(.red)
                GeometryReader { geo in
                    Image("Example")
                        .resizable()
                        .scaledToFit()
                        //.scaledToFill()
                        .frame(width: geo.size.width * 0.8)
                }
                .frame(height: 100)
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
            }
            .frame(alignment: .top)
            Spacer()
        }
        
            //.clipped()
    }
}

struct ContentViewImage_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewImage()
    }
}
