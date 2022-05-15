//
//  ContentView5.swift
//  HackingWithSwift100DaysSwiftUI
//
//  Created by Guillaume on 14/05/2022.
//

import SwiftUI

struct ContentView5: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var score = 0
    
    // Pour générer un message d'erreur
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never) // pas de lettre capitale
                }
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("\(score)")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("New Game", action: startGame)
                }
            }
            .onSubmit(addNewWord) // When Enter is tapped
            .onAppear(perform: startGame)
            // Message d'erreur préparé
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Plus de problèmes de contraintes
    }
    
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        // Le mot contient au moins un caractère
        guard answer.count > 0 else { return }
        // Il n'est pas déjà entré dans le tableau
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        // Le mot peut-il être créé avec les lettres présentes ?
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        // Le mot existe-t-il ?
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation { // Insertion du mot avec une légère animation
            score += answer.count
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func isOriginal(word: String) -> Bool {
        // word est-il déjà présent dans le tableau usedWords ?
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        // On crée une copie du mot de référence
        var tempWord = rootWord
        
        for letter in word {
            // On prend chaque lettre de la proposition et on compare
            if let pos = tempWord.firstIndex(of: letter) { // On relève la position de la lettre commune
                tempWord.remove(at: pos)
                // Et on l'enlève de la copie de référence
            } else {
                return false
            }
        }
        return true
    }
    func isReal(word: String) -> Bool {
        // Contient un lexique
        let checker = UITextChecker()
        // Taille du mot à vérifier
        let range = NSRange(location: 0, length: word.utf16.count)
        // On vérifie l'existence du mot
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")// Mettre fr pour le français
        return misspelledRange.location == NSNotFound
    }
    
    func startGame() {
        usedWords = [String]() // On remet à zéro
        // 1. On trouve le fichier grâce à son nom et son extension
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. On charge le fichier start.txt sous forme d'un string
            if let startWords = try? String(contentsOf: fileURL) {
                // 3. On convertit le string en tableau à chaque retour à la ligne
                let allWords = startWords.components(separatedBy: "\n") // \n = retour à la ligne
                // 4. On choisit un des mots au hasard. En cas de vide (ce qui ne peut pas arriver, mais par sécurité, on prend "silkworm"
                rootWord = allWords.randomElement() ?? "silkworm"
                return // Terminé
            }
        }
        // Si l'un des éléments ne fonctionne pas...
        fatalError("Could not load start.txt from bundle.")
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}
