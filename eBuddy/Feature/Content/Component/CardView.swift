//
//  CardView.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct CardView: View {
    @Environment(\.colorScheme) var colorScheme
    var viewModel: ContentViewModel
    var user: UserModel
    
    var body: some View {
        VStack {
            Spacer(minLength: 24)
            CardHeaderView(name: user.name,
                           isOnline: user.isOnline)
                .padding([.leading, .trailing], 24)
            Spacer(minLength: 24)
            CardContentView(viewModel: viewModel,
                            gender: user.gender,
                            games: user.games)
            Spacer(minLength: 24)
            CardRatingView(rating: user.rating,
                           ratingCount: user.ratingCount)
            Spacer(minLength: 16)
            CardPricingView(price: user.price)
            Spacer(minLength: 16)
        }
        .background(colorScheme == .dark ? Color.black : Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}
