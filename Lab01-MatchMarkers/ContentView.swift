//
//  ContentView.swift
//  Lab01-MatchMarkers
//
//  Created by COSC Student on 2026-01-16.
//

import SwiftUI

struct MatchMarkersView: View {
    let game = MasterMindModel()
    
    var body: some View {
        VStack{
            view(for: game.masterCode)
            view(for: game.guess)
//            pegs(colors:[.red, .blue, .yellow, .blue])
            
        }.padding()
    }
    
    func view(for code: Code) -> some View {
        
        HStack {
            ForEach(
                code.pegs.indices,
                id: \.self){
                    index in RoundedRectangle(cornerRadius: 10)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundStyle(code.pegs[index])
                }
            
            
            MatchMarkers(match: [.exact, .inexact, .inexact, .noMatch])
            
        }.padding()
    }
}

#Preview {
    MatchMarkersView()
}
