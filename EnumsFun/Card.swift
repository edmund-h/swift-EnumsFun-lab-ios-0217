//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case spades="♠️", clubs="♣️", diamonds="♦️", hearts="♥️"
}

enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var description: String {
        switch self.rawValue {
        case 2...10:
            return "\(self.rawValue)"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        case 14:
            return "A"
        default:
            return ""
        }
    }
}

class Card {
    let suit: Suit
    let rank: Rank
    
    init (rank myRank: Rank, suit mySuit: Suit ){
        suit = mySuit
        rank = myRank
    }
    
    var description: String {
        return "\(rank.description)\(suit.rawValue)"
    }
    
    
}
