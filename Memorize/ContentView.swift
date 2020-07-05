//
//  ContentView.swift
//  Memorize
//
//  Created by Keenan McDonald on 7/1/20.
//  Copyright © 2020 Keenan McDonald. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        return HStack {
            ForEach(self.viewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    self.viewModel.choose(card: card)
                }
            }
                .padding(4)
                .foregroundColor(Color.orange)
            .font(self.viewModel.cards.count >= 5 ? Font.body : Font.largeTitle)
        }
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
            else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }.aspectRatio(0.66, contentMode: .fit)
        
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
