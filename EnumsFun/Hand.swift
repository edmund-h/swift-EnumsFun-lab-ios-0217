//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card]
    
    init (cards cardsIn: [Card]) {
        cards = cardsIn
    }
    
    var size: Int {
        return cards.count
    }
    
    func flip () -> Card? {
        guard !cards.isEmpty else {return nil}
        let myCard = cards[0]
        cards.remove(at: 0)
        return myCard
    }//note that this function treats the card at 0 as the top of the hand
    
    func give (card: Card){
        cards.append(card)
    }//note that since 0 is the top of the hand, appending puts card at the bottom of the hand
    
    func lose (card: Card){
        guard let myIndex = cards.index(where:{$0.description == card.description})else {return}
        cards.remove(at: myIndex)
    }//this will try to locate the card in the hand and remove that card, or else just do nothing
}
