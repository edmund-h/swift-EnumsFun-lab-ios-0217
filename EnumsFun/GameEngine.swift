//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    /*dd a property called player1 of type Player to GameEngine.
     Add a property called player2 of type Player.
     Add a property called deck of type Deck.
     Create an initializer for GameEngine that takes two Player parameters called player1 and player2, both of type String, representing the names of the game's players. This initializer should create a deck of cards and split it in half, then create two Player instances and assign them to the appropriate property.
     Implement a method called playOneTurn() that returns a three-element tuple of type (Player, Card?, Card?), representing the winning player of this turn, the card that player1 flipped over, and the card that player2 flipped over. This method should flip cards for each player. Remember, the player with the highest card wins!
     Implement a method called award(cards:to:). This methods first parameter is called cards of type [Card]. The second parameter should be called player of type Player. It should give the player all of the cards. (Hint: Don't forget about the give(card:) method you implemented on the Player class.)
     Implement a method called gameOver() that returns true when the game is over. (The game is over when either player has run out of cards.)*/

    let player1: Player
    let player2: Player
    var deck: Deck
    
    init (player1: String, player2: String) {
        self.deck = Deck()
        let playerDecks = deck.split()
        self.player1 = Player(name: player1, hand: Hand(cards: playerDecks.0))
        self.player2 = Player(name: player2, hand: Hand(cards: playerDecks.1))
    }
    
    func playOneTurn () -> (Player, Card?, Card?) {
        let card1 = player1.flip()
        let card2 = player2.flip()
        if card2 == nil && card1 != nil
        {return (player1, nil, nil)} //p1 wins when p2 has no cards
        if card1 == nil && card2 != nil
        {return (player2, nil, nil)} //p2 wins when p1 has no cards
        
        if let card1rank = card1?.rank.rawValue{
            if let card2rank = card2?.rank.rawValue{
                guard card2rank > card1rank else { return (player1,card1,card2) }
                return (player1,card1,card2)  //p1 wins when card rank > p2 card rank otherwise p2 wins
                }
            }
        let nilPlayer = Player (name: "", hand: Hand(cards: []))
        return (nilPlayer,card1,card2)
        // will return an empty winner with no cards if we get to this point,
        //which should not be possible unless both hands start out empty
    }
    
    func award (cards: [Card] , to myPlayer: Player) {
        for eachCard in cards {
            myPlayer.give(card: eachCard)
        }
    }
    
    func gameOver()->Bool {
        if player1.hasCards() && player2.hasCards() {return false}
        return true
    }
}
    






