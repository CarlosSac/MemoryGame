//
//  CardView.swift
//  MemoryGame
//
//  Created by Carlos Sac on 10/20/25.
//

import SwiftUI

struct CardView: View {
    let icon: String
    let isFaceUp: Bool
    let isMatched: Bool
    let onTap: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(isFaceUp ? Color.white : Color.accentColor)
                .shadow(radius: 5)
                .opacity(isMatched ? 0.3 : 1)

            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.accentColor)
                .rotation3DEffect(.degrees(isFaceUp ? 0 : -180), axis: (x: 0, y: 1, z: 0), perspective: 0.6)
                .opacity(isFaceUp ? (isMatched ? 0 : 1) : 0)
            
            Image(systemName: "questionmark.circle.fill")
                .imageScale(.large)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .rotation3DEffect(.degrees(isFaceUp ? 180 : 0), axis: (x: 0, y: 1, z: 0), perspective: 0.6)
                .opacity(isFaceUp ? 0 : 1)
        }
        .aspectRatio(2/3, contentMode: .fit)
        .padding(8)
        .contentShape(Rectangle())
        .animation(.spring(response: 0.45, dampingFraction: 0.7), value: isFaceUp)
        .animation(.easeOut(duration: 1.0).delay(0.1), value: isMatched)
        .onTapGesture {
            onTap()
        }
    }
}

struct Icons {
    let icon: String

    static let mockedIcons = ["star.fill", "heart.fill", "circle.fill", "square.fill", "triangle.fill"]
}

#Preview {
    VStack(spacing: 20) {
        CardView(icon: "star.fill", isFaceUp: true, isMatched: false, onTap: {})
        CardView(icon: "heart.fill", isFaceUp: true, isMatched: true, onTap: {})
    }
}
