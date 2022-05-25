//
//  Choice.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 25/05/2022.
//

import Foundation

struct Choice: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
}

enum IndexSearch {
    case commits
    case repositories
    case users
}
