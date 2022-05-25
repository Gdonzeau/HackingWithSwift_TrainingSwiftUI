//
//  ResultSearch.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 25/05/2022.
//

import SwiftUI

struct ResultSearch: View {
    
    @State private var resultsOfSearch = [Item]()
    @State private var resultOfSearchUsers = [Utilisateur]()
    @State private var resultOfSearchRepos = [DataRepository]()
    @State private var howManyAnswers:Int?
    let search: String
    let typeOfSearch: String
    @State private var indexSearch: IndexSearch = .commits
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if let answers = howManyAnswers {
                        if answers > 0 {
                            ForEach(resultsOfSearch, id: \.url) { answer in
                                
                                Text(answer.repository.name)
                                    .padding()
                                Divider()
                            }
                            
                            ForEach(resultOfSearchUsers, id: \.login) { answer in
                                
                                Text(answer.login)
                                    .padding()
                                Divider()
                            }
                            ForEach(resultOfSearchRepos, id: \.name) { answer in
                                
                                Text(answer.name)
                                    .padding()
                                Divider()
                            }
                        } else {
                            Text("No answer")
                        }
                    } else { // No answer yet
                        ProgressView()
                    }
                }
                .navigationTitle("Searching \(typeOfSearch)")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .task {
            indexSearch = determineIndexSearch(index: typeOfSearch)
            await loadRepos()
        }
    }
    
    func determineIndexSearch(index: String) -> IndexSearch {
        
        switch index {
        case "commits" :
            indexSearch = .commits
            
        case "repositories" :
            indexSearch = .repositories
            
        case "users" :
            indexSearch = .users
            
        default:
            indexSearch = .commits
        }
        return indexSearch
    }
    
    func loadRepos() async {
        print("Trying to launch")
        guard let url = URL(string: "https://api.github.com/search/\(typeOfSearch)?q=\(search)") else {
            print("Invalid URL.")
            return
        }
        print("Url is valid")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            //print("data : \(String(describing: data))")
            //print("response : \(String(describing: response))")
            //print("error: \(String(describing: error))")
            if let data = data, error == nil {
                print("Launching request")
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    print("Decode")
                    switch indexSearch {
                        
                    case .commits:
                        
                        if let decodeResponse = try? JSONDecoder().decode(DataReceivedCommit.self, from: data) {
                            print("ok")
                            let numberOfAnswers = decodeResponse.total_count
                            let responses = decodeResponse.items
                            resultsOfSearch = responses
                            howManyAnswers = numberOfAnswers
                            print("Trouvés : \(numberOfAnswers)")
                            
                        } else {
                            print("Echec")
                        }
                        
                    case .repositories:
                        
                        if let decodeResponse = try? JSONDecoder().decode(DataReceivedRepository.self, from: data) {
                            print("ok")
                            let numberOfAnswers = decodeResponse.total_count
                            let responses = decodeResponse.items
                            resultOfSearchRepos = responses
                            howManyAnswers = numberOfAnswers
                            print("Trouvés : \(numberOfAnswers)")
                            
                        } else {
                            print("Echec")
                        }
                        
                    case .users:
                        
                        if let decodeResponse = try? JSONDecoder().decode(DataReceivedUser.self, from: data) {
                            print("ok")
                            let numberOfAnswers = decodeResponse.total_count
                            let responses = decodeResponse.items
                            resultOfSearchUsers = responses
                            howManyAnswers = numberOfAnswers
                            print("Trouvés : \(numberOfAnswers)")
                            
                        } else {
                            print("Echec")
                        }
                        
                    }
                }
            }
        }
        task.resume()
    }
}

struct ResultSearch_Previews: PreviewProvider {
    static var previews: some View {
        ResultSearch(search: "Test", typeOfSearch: "commits")
    }
}
