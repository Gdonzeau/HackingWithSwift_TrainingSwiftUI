//
//  ContentViewActualizeView.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume Donzeau on 07/11/2022.
//

import SwiftUI

struct ContentViewActualizeView: View {
    let colorGenerator = ColorGenerator.shared
    let coloredObjects = ColoredObjects.shared

    @State var coloredCollection = [ColoredObject]()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .onAppear(perform: onAppear)
        Button("Actualize") {
            colorGenerator.changeColorRandomObject()
        }
        .padding()
     //   let _ = print("ROUGEE coloredObjects.objects: \(coloredObjects.objects.forEach( { $0.color }))")
        ScrollView(.horizontal) {
            HStack {
            ForEach (coloredCollection, id: \.number) { objet in
                ColoredObjectView(color: objet.color)
                    .onAppear(perform: test)
            }
        }
    }
        .onReceive(coloredObjects.$objects) { objects in
            self.coloredCollection = objects
            checkTouched(objects: objects)
        }
    }

    func onAppear() {
        coloredCollection = coloredObjects.objects
    }

    func test() {
        print("Test")
    }

    func checkTouched(objects: [ColoredObject]) {
        for (index,object) in objects.enumerated() {
            if object.color == .red {
                animation(index: index)
            }
        }
    }

    func animation(index: Int) {

    }
}

struct ContentViewActualizeView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentViewActualizeView()
    }
}
