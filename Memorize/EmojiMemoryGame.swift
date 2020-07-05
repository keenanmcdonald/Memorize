//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Keenan McDonald on 7/2/20.
//  Copyright © 2020 Keenan McDonald. All rights reserved.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🤬", "🙈", "🐓", "🤠", "🌝"]
        let numberOfPairs = 5 //Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairs: numberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    //MARK: Access to the models
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
