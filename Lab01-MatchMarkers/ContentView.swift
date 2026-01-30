//
//  ContentView.swift
//  Lab01-MatchMarkers
//
//  Created by COSC Student on 2026-01-16.
//

import SwiftUI

struct MatchMarkersView: View {
    var body: some View {
        VStack{
            pegs(colors:[.red,.green,.yellow], matches: [.exact,.inexact,.inexact])
            pegs(colors:[.blue,.green,.blue],matches: [.exact,.inexact,.exact])
            
            pegs(colors:[.red,.green,.yellow,.blue],matches: [.exact,.inexact,.inexact,.exact])
            pegs(colors:[.red,.yellow,.red,.green],matches: [.exact,.inexact,.inexact,.noMatch])
            
            pegs(colors:[.red,.green,.yellow,.blue,.red],matches: [.exact,.inexact,.inexact,.exact,.inexact])
            pegs(colors:[.yellow,.green,.blue,.blue,.red],matches: [.exact,.inexact,.inexact,.noMatch,.noMatch])
            
            pegs(colors:[.blue,.green,.yellow,.blue,.red,.blue],matches: [.exact,.inexact,.exact,.exact,.exact,.exact])
            pegs(colors:[.green,.green,.yellow,.blue,.green,.green],matches: [.inexact,.inexact,.inexact,.exact,.noMatch,.noMatch])
            
        }.padding()
    }
    
    func pegs(colors: Array<Color>, matches: [Match]) -> some View {
        HStack {
            ForEach(
                colors.indices,
                id: \.self){
                    index in RoundedRectangle(cornerRadius: 10)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundStyle(colors[index])
                }
            
            
            MatchMarkers(match: matches)
            
        }.padding()
    }
}

#Preview {
    MatchMarkersView()
}
