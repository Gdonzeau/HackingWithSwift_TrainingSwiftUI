//
//  ContentViewSheet.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 16/05/2022.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismisss
    let name: String
    
    var body: some View {
        Text("Hello \(name)")
        Button("Dismiss") {
            dismisss()
        }
        .padding()
    }
}

struct ContentViewSheet: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Guillaume")
        }
    }
}

struct ContentViewSheet_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewSheet()
    }
}
