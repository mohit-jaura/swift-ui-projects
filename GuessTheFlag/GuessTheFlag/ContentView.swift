//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mohit Soni on 24/05/22.
//

import SwiftUI

struct FlagImage:View{
    
    var flag:String
    var body: some View{
        Image(flag)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    //MARK: State properties
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var gameFinished = false
    @State private var scoreTitle = ""
    @State private var gameRound = 1
    @State private var totalScore = 0
    @State private var rotateFlag = false
    @State private var selectedFlag = 0
    
    //MARK: Body
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold))
                Spacer()
                Spacer()
                Text("Score: \(totalScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                VStack( spacing: 15) {
                    VStack{
                        Text("Tap the flag of")
                            .foregroundColor(.black)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3){
                        flag in
                        Button{
                            flagTapped(flag: flag)
                        } label: {
                            FlagImage(flag: countries[flag])
                                .rotation3DEffect(.degrees((rotateFlag && flag == correctAnswer) ? 360 : 0), axis: (x:0,y:1,z:0))
                                .opacity((rotateFlag && flag != correctAnswer) ? 0.25 : 1)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                if gameRound < 8{
                    askQuestion()
                }else{
                    gameFinished = true
                }
            }
        }
        .alert("Game finished", isPresented: $gameFinished) {
            Button("Restart") {
                resetGame()
            }
        }message: {
            Text("Your score is \(totalScore)")
        }
    }
    
    //MARK: Methods
    fileprivate func flagTapped(flag:Int){
        if flag == correctAnswer{
            scoreTitle = "Correct"
            withAnimation {
                rotateFlag = true
            }
            totalScore += 1
        }else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    fileprivate func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        rotateFlag = false
        gameRound += 1
    }
    
    fileprivate func resetGame(){
        gameRound = 1
        totalScore = 0
        rotateFlag = false
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
