//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var cards: [Card] = []
    
    init () {
        let allSuits: [Suit] = [.spades , .clubs , .hearts , .diamonds]
        let allRanks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]
        for index in 0..<52 {
            let rank = (index % 13)
            let suit = (index % 4)
            cards.append(Card(rank: allRanks[rank], suit: allSuits[suit]))
        }
    }
    
    func split () -> ([Card],[Card]) {
        return cards.split()
    }
  
}


