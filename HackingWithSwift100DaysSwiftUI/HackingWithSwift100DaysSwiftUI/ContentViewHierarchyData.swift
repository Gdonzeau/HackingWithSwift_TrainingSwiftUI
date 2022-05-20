//
//  ContentViewHierarchyData.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 19/05/2022.
//

import SwiftUI

struct User: Codable {
    let name: String
    let adress: Adress
}

struct Adress: Codable {
    let street: String
    let city: String
}

struct ContentViewHierarchyData: View {
    var body: some View {
        Button("Decode JSON") {
            //print("Go")
            let input = """
            {
            "name": "Taylor Swift",
            "adress": {
                "street": "555, Taylor Swift Avenue",
                "city": "Nashville"
                }
            }
            """
            let data = Data(input.utf8)
            
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.adress.street)
            }
        }
    }
}

struct ContentViewHierarchyData_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewHierarchyData()
    }
}
