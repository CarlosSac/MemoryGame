//
//  ContentView.swift
//  MemoryGame
//
//  Created by Carlos Sac on 10/16/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pairCount: Int = 6
    @State private var resetState: Bool = false
    @State private var cards: [Card] = []
    @State private var flippedCards: [Int] = []
    
    private func createCard() -> [Card] {
        _ = resetState
        let base = Icons.mockedIcons
        let icon = (0..<pairCount).map { base[$0 % base.count] }
        var deck = (icon + icon).map { Card(icon: $0) }
        deck.shuffle()
        return deck
    }
    private func selectCard(at index: Int) {
        // Game logic to handle card selection
        guard !cards[index].isFaceUp && !cards[index].isMatched else { return }
        
        flippedCards.append(index)
        cards[index].isFaceUp = true
        if flippedCards.count == 2 {
            let firstCard = flippedCards[0]
            let secondCard = flippedCards[1]
            
            if cards[firstCard].icon == cards[secondCard].icon {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    cards[firstCard].isMatched = true
                    
                    cards[secondCard].isMatched = true
                }
            }
            else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    cards[firstCard].isFaceUp = false
                    cards[secondCard].isFaceUp = false
                }
            }
            flippedCards.removeAll()
        }
    }

    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 8), count: 3)

    var body: some View {
        VStack(spacing: 0) {
            
            
            HStack{
                Menu{
                    Button("3 pairs"){
                        pairCount = 3
                        flippedCards.removeAll()
                        cards = createCard()
                    }
                    Button("6 pairs"){
                        pairCount = 6
                        flippedCards.removeAll()
                        cards = createCard()
                    }
                    Button("9 pairs"){
                        pairCount = 9
                        flippedCards.removeAll()
                        cards = createCard()
                    }
                    
                } label:{
                    Text("Choose size")
                        .font(.headline)
                }
                
                Spacer()
                
                Button(action:{
                    resetState.toggle()
                    flippedCards.removeAll()
                    cards = createCard()
                }){
                    Text("Reset")
                        .font(.headline)
                    
                }
                
            }
            
        .padding(.horizontal, 20)
        .padding([.top,.bottom])
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(cards.indices, id: \.self) { index in
                                            CardView(
                                                icon: cards[index].icon,
                                                isFaceUp: cards[index].isFaceUp,
                                                isMatched: cards[index].isMatched,
                                                onTap: { selectCard(at: index) }

                                            )
                                        }
                                }
                .padding()
            }
        }
        .onAppear {
            cards = createCard()}
    }
}

#Preview {
    ContentView()
}
