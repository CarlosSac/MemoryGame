//
//  CardView.swift
//  MemoryGame
//
//  Created by Carlos Sac on 10/20/25.
//

import SwiftUI

struct CardView: View {
    var icon: String = "star.fill"
    @State private var isFaceUp: Bool = false

    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 20)
                .fill(isFaceUp ? Color.white : Color.accentColor)
                .shadow(radius: 5)


            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.accentColor)
                // rotate front so it's hidden when face down
                .rotation3DEffect(.degrees(isFaceUp ? 0 : -180), axis: (x: 0, y: 1, z: 0), perspective: 0.6)
                .opacity(isFaceUp ? 1 : 0)
            
            Image(systemName: "questionmark.circle.fill")
                .imageScale(.large)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .rotation3DEffect(.degrees(isFaceUp ? 180 : 0), axis: (x: 0, y: 1, z: 0), perspective: 0.6)
                .opacity(isFaceUp ? 0 : 1)
        }
        // Use a flexible aspect ratio so the grid columns can size cards to available width
        .aspectRatio(2/3, contentMode: .fit)
        .padding(8)
        .contentShape(Rectangle())
        // Animate changes to isFaceUp
        .animation(.spring(response: 0.45, dampingFraction: 0.7), value: isFaceUp)
        // Toggle face up on tap
        .onTapGesture {
            withAnimation {
                isFaceUp.toggle()
            }
        }
    }
}

struct Icons {
    let icon: String

    static let mockedIcons = ["star.fill", "heart.fill", "circle.fill", "square.fill", "triangle.fill"]
}

#Preview {
    VStack(spacing: 20) {
        CardView(icon: "star.fill")
        CardView(icon: "heart.fill")
    }
}
