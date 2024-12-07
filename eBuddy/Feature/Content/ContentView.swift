//
//  ContentView.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationStack {
            CardView(viewModel: viewModel,
                     name: "Zynx",
                     isOnline: true,
                     gamesImg: ["img_game1", "img_game2"],
                     rating: "4.9",
                     ratingCount: 61,
                     price: "100.00",
                     priceDuration: 1
            )
            .shadow(color: (colorScheme == .dark ? Color.white   : Color.black).opacity(0.4), radius: 8)
            .padding()
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(userData: UserData()))
}
