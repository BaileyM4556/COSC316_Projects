//
//  ContentView.swift
//  Lab01-MatchMarkers
//
//  Created by COSC Student on 2026-01-16.
//

import SwiftUI

struct MatchMarkersView: View {
    @State var game = MasterMindModel()
    
    var body: some View {
        VStack{
            view(for: game.masterCode)
            ScrollView{
                view(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self){
                    index in view(for: game.attempts[index])
                }
            }
            
//            pegs(colors:[.red, .blue, .yellow, .blue])
            
        }.padding()
        
        Button("Restart"){
            game.restartGame()
        }.padding(10)
        Button("Guess"){
            game.recordAttempts()
        }
    }
    
    func view(for code: Code) -> some View {
        
        HStack {
            ForEach(
                code.pegs.indices,
                id: \.self){
                    index in RoundedRectangle(cornerRadius: 10)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundStyle(code.pegs[index])
                        .onTapGesture {
                            if code.kind == .guess {
                                game.chooseNextPeg(at: index)
                            }
                            
                        }
                }
            
            
            MatchMarkers(match: code.matches)
            
        }.padding()
    }
}

#Preview {
    MatchMarkersView()
}
