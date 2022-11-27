//
//  ContentViewBlurTest.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 20/09/2022.
//

import SwiftUI

struct ContentViewBlurTest: View {
    let styles : [(description: String, style: UIBlurEffect.Style)] = [
        (description: "ultra thin", style: .systemUltraThinMaterial),
        (description: "thin", style: .systemThinMaterial),
        (description: "normal", style: .systemMaterial),
        (description: "thick", style: .systemThickMaterial),
        (description: "chrome", style: .systemChromeMaterial)
    ]
    @State var styleIndex = 2


    var body: some View {
        ZStack {
            Image("Example")
            Text("Pour tester le flou du filtre devant, j'utilise ce texte assez long pour convrir une partie suffisante de l'écran.")
                .frame(width: 200)
                .padding()
                .background(.black)
                .foregroundColor(.white)
                .blur(radius: 4)
            
            VStack(alignment: .leading, spacing: 30) {
                //Text("World's Greatest Flag")
                Color(UIColor.hexa(hex: "#181818"))
                    .frame(width: 300, height: 500)
                    //.font(.largeTitle)
                    //.padding()
                    //.background(Blur(style: .systemThinMaterial))
                    .opacity(0.8)
                    //.cornerRadius(15.0)
                    //.frame(minWidth: .infinity, alignment: .bottom)

//                Color(.red)
//                    .frame(width: 100, height: 100)
//                    .opacity(0.2)
//                    .background(Blur(style: .systemUltraThinMaterialLight))
            }


        }
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}



struct ContentViewBlurTest_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewBlurTest()
    }
}

extension UIColor {

    static func hexa(hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
