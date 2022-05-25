//
//  DataReceived.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 24/05/2022.
//

import Foundation

struct DataReceivedCommit: Codable {
    var items: [Item]
    var total_count: Int
}

struct DataReceivedUser: Codable {
    var items: [Utilisateur]
    var total_count: Int
}

struct DataReceivedRepository: Codable {
    var items: [DataRepository]
    var total_count: Int
}

struct Item: Codable {
    var url: String
    var commit: DataCommit
    var repository: DataRepository
    var score: Double
}

struct DataCommit: Codable {
    var url: String
    var author: DataAuthor
}

struct DataAuthor: Codable {
    var name: String
    var email: String
}

struct DataRepository: Codable {
    var id: Int
    var name: String
}

struct Utilisateur: Codable {
    var login: String
    var avatar_url: String
}
