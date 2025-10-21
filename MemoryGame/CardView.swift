//
//  CardView.swift
//  MemoryGame
//
//  Created by Carlos Sac on 10/20/25.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 5)
                .padding()
            
            
            VStack {
                Image(systemName: "star.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }

        }
        .frame(width: 150, height: 225)
        
    }
}

struct Icons {
    let icon: String
    
    static let mockedIcons = ["star.fill", "heart.fill", "circle.fill", "square.fill", "triangle.fill"]
}
#Preview {
    CardView()
}
