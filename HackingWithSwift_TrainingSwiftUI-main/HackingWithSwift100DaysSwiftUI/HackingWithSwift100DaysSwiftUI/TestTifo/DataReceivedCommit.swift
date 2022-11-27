//
//  DataReceived.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 24/05/2022.
//

import Foundation

struct DataReceivedCommit: Codable { // Fichier type sur une demande de commit
    var items: [Item]
    var total_count: Int
}

struct DataReceivedUser: Codable { // Fichier type sur une demande d'utilisateur
    var items: [Utilisateur]
    var total_count: Int
}

struct DataReceivedRepository: Codable { // Fichier type sur une demande de dépot
    var items: [DataRepository]
    var total_count: Int
}

struct Item: Codable {
    var url: String
    var commit: DataCommit
    var repository: DataRepository
    var score: Double
    //var owner: Utilisateur
}

struct DataCommit: Codable {
    var url: String
    var author: DataAuthor
    var message: String
}

struct DataAuthor: Codable {
    var name: String
    var date: String
    var email: String
}

struct DataRepository: Codable {
    var id: Int
    var name: String
}

struct Utilisateur: Codable {
    var login: String
    var id: Int
    var avatar_url: String
}
