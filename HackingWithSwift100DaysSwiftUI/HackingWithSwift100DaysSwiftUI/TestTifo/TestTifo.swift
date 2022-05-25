//
//  TestTifo.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 24/05/2022.
//

import SwiftUI
//import Collections

struct TestTifo: View {
    //@State private var resultsOfSearch = [Item]()
    @State private var search = ""
    //@State private var typeOfSearch = "commits"
    
    let choices: [String:Choice] = Bundle.main.decode("choices.json")
    @State private var indexSearch: IndexSearch = .repositories
    
    var body: some View {
        NavigationView {
            
            let keys = choices.map{$0.key}
            let values = choices.map {$0.value}
            
            if search.count > 0 {
                List(keys.indices, id: \.self) { index in
                    
                    NavigationLink {
                        ResultSearch(search: search, typeOfSearch: values[index].id)
                    } label: {
                        Text("\(Image(systemName: values[index].description)) \(values[index].name) avec \(search)")
                            .padding()
                    }
                }
                .navigationTitle("GitHub fetcher")
                .navigationBarTitleDisplayMode(.inline)
                
            } else {
                List {
                    HStack {
                        Image(systemName: "arrow.down")
                        Spacer()
                        Text("Swipe down for a search")
                        Spacer()
                        Image(systemName: "arrow.down")
                    }
                }
                .navigationTitle("GitHub fetcher")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .searchable(text: $search, prompt: "Enter your query")
        //.onSubmit(of: .search, loadRepos) // When Enter is tapped
        .preferredColorScheme(.light)
        .navigationViewStyle(StackNavigationViewStyle()) // Plus de problèmes de contraintes
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
    /*
     func loadRepos() {
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
     
     if let decodeResponse = try? JSONDecoder().decode(DataReceived.self, from: data) {
     print("ok")
     // Lets transfer photos received
     let repos = decodeResponse.total_count
     let responses = decodeResponse.items
     resultsOfSearch = responses
     //resultsOfSearch = repos
     print("Trouvés : \(repos)")
     } else {
     print("Echec")
     }
     }
     }
     }
     task.resume()
     }
     */
}

struct TestTifo_Previews: PreviewProvider {
    static var previews: some View {
        TestTifo()
    }
}
