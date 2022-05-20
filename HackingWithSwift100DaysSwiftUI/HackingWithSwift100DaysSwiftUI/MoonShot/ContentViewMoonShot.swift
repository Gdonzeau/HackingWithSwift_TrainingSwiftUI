//
//  ContentViewMoonShot.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 20/05/2022.
//

import SwiftUI

struct ContentViewMoonShot: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ContentViewMoonShot_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewMoonShot()
    }
}
