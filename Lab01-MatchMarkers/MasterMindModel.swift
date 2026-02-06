//
//  MasterMindModel.swift
//  Lab01-MatchMarkers
//
//  Created by Bailey Mawhinney on 2026-01-30.
//
import SwiftUI

typealias Peg = Color

struct MasterMindModel {
    var masterCode: Code = Code(kind: .master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = [Code]()
    var pegChoice: [Peg] = [.red, .blue, .green, .yellow]
    
    mutating func recordAttempts(){
        var attempt = guess
        attempt.kind = .attempt(attempt.match(against: masterCode))
        attempts.append(attempt)
    }
    
    mutating func chooseNextPeg(at index: Int) {
        let currentPeg: Peg = guess.pegs[index]
        if let indexOfCurrentPegInPegInPegChoices: Int = pegChoice.firstIndex(of: currentPeg){
            guess.pegs[index] = pegChoice[(indexOfCurrentPegInPegInPegChoices + 1) % pegChoice.count]
        }else{
            guess.pegs[index] = pegChoice.first ?? Code.missing
        }
        
    }
}

struct Code{
    var kind: Kind
    var pegs: [Peg] = [.red, .red, .blue, .green]
    static let missing: Peg = .clear
    
    enum Kind : Equatable{
        case master
        case guess
        case attempt([Match])
    }
    
    var matches: [Match] {
        switch kind {
            case .attempt(let matches) : return matches
            case .master, .guess: return []
        }
        
    }
    
    func match(against otherCode: Code) -> [Match] {
        var results: [Match] = Array(repeating: .noMatch, count: pegs.count)
        var pegsToMatch = otherCode.pegs
        
        for index in pegs.indices.reversed() {
            if pegsToMatch.count > index,
               pegsToMatch[index] == pegs[index] {
                   results[index] = .exact
                   pegsToMatch.remove(at: index)
               }
        }
        
        for index in pegs.indices {
            if results[index] != .exact {
                if let matchIndex = pegsToMatch.firstIndex(of: pegs[index]) {
                    results[index] = .inexact
                    pegsToMatch.remove(at: matchIndex)
                }
            }
        }
        
        return results
        
    }
}


