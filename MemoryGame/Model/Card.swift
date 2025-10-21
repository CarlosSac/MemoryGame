//
//  Card.swift
//  MemoryGame
//
//  Created by Carlos Sac on 10/21/25.
//

import Foundation

struct Card: Identifiable, Equatable {

    let id: UUID
    let icon: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    init (icon: String) {
        self.id = UUID()
        self.icon = icon
    }
}

