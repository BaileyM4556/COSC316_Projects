//
//  Match.swift
//  Lab01-MatchMarkers
//
//  Created by COSC Student on 2026-01-16.
//
import SwiftUI

enum Match{
    case exact
    case inexact
    case noMatch
}

struct MatchMarkers: View {
    var match: [Match]
    var body: some View {
        if(match.count == 3){
            HStack{
                VStack{
                    matchMarker(peg: 0)
                    matchMarker(peg: 1)
                }
                VStack{
                    matchMarker(peg: 2)
                    Circle().fill(Color.clear)
                }

            }
        }
        else if(match.count == 4){
            HStack{
                VStack{
                    matchMarker(peg: 0)
                    matchMarker(peg: 1)
                }
                VStack{
                    matchMarker(peg: 2)
                    matchMarker(peg: 3)
                }

            }
        }
        else if(match.count == 5){
            HStack{
                VStack{
                    matchMarker(peg: 0)
                    matchMarker(peg: 1)
                }
                VStack{
                    matchMarker(peg: 2)
                    matchMarker(peg: 3)
                }
                VStack{
                    matchMarker(peg: 4)
                    Circle().fill(Color.clear)
                }

            }
        }
        else if(match.count == 6){
            HStack{
                VStack{
                    matchMarker(peg: 0)
                    matchMarker(peg: 1)
                }
                VStack{
                    matchMarker(peg: 2)
                    matchMarker(peg: 3)
                }
                VStack{
                    matchMarker(peg: 4)
                    matchMarker(peg: 5)
                }

            }
        }
        
        
    }
    
    func matchMarker(peg: Int) -> some View {
        
        let matchCount:Int = match.count{$0 == .exact}
        
        let foundCount:Int = match.count{$0 != .noMatch}
        
        return Circle()
            .fill(matchCount > peg ? Color.primary: Color.clear)
            .stroke (foundCount > peg ? Color.primary: Color.clear, lineWidth:2)
    }
}

#Preview {
    MatchMarkers(match: [.exact, .inexact, .exact,.exact,.inexact,.noMatch])
}
