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
}

struct Code{
    var kind: Kind
    var pegs: [Peg] = [.red, .red, .blue, .green]
    
    enum Kind{
        case master
        case guess
        case attempt
    }
}


