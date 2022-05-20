//
//  Mission.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 20/05/2022.
//

import Foundation

struct CrewRole: Codable {
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
