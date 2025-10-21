//
//  ContentView.swift
//  MemoryGame
//
//  Created by Carlos Sac on 10/16/25.
//

import SwiftUI

struct ContentView: View {
    private let icons: [String] = {
        let base = Icons.mockedIcons
        return (0..<60).map { base[$0 % base.count] }
    }()

    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 8), count: 3)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(Array(icons.enumerated()), id: \ .offset) { _, icon in
                    CardView(icon: icon)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
