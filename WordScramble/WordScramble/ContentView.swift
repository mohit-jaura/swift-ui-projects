//
//  ContentView.swift
//  WordScramble
//
//  Created by Mohit Soni on 26/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var newWord = ""
    @State private var rootWord = ""
    @State private var errorTittle = ""
    @State private var errorMessage = ""
    @State private var showError = false
    @State private var winCount = 0
    
    var body: some View {
        NavigationView{
            
            List{
                Section{
                    TextField("Enter a word", text: $newWord)
                        .autocapitalization(.none)
                }
                Section{
                    HStack(){
                        Text("You guess right \(winCount) times")
                        Spacer()
                            Button("Restart"){
                                startGame()
                            }
                            .buttonStyle(.borderedProminent)
                    }
                }
                Section{
                    ForEach(usedWords,id: \.self){
                        word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addWord)
            .onAppear(perform: startGame)
            .alert(errorTittle, isPresented: $showError) {
                Button("OK",role: .cancel){}
            }message: {
                Text(errorMessage)
            }
        }
    }
    
    func addWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else{return}
        
        guard isOriginal(word: answer) else{
            showALert(tittle: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else{
            showALert(tittle: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else{
            showALert(tittle: "Word not recognize", message: "You can't just make them up, you know!")
            return
        }
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        winCount += 1
        newWord = ""
    }
    
    func startGame(){
        if let url = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let fileContent = try? String(contentsOf: url){
                let allWords = fileContent.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "peace"
                winCount = 0
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word:String) -> Bool{
        return !usedWords.contains(word )
    }
    
    func isPossible(word:String) -> Bool{
        var tempWord = rootWord
        
        for letter in word{
            if let position = tempWord.firstIndex(of: letter){
                tempWord.remove(at: position)
            }else{
                return false
            }
        }
        return true
    }
    
    func isReal(word:String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func showALert(tittle:String,message:String){
        errorTittle = tittle
        errorMessage = message
        showError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
