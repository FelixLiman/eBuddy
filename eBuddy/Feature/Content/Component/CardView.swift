//
//  CardView.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct CardView: View {
    var viewModel: ContentViewModel
    let name: String
    let isOnline: Bool
    let gamesImg: [String]
    let rating: String
    let ratingCount: Int
    let price: String
    let priceDuration: Int
    
    var body: some View {
        VStack {
            Spacer(minLength: 24)
            CardHeaderView(name: name, isOnline: isOnline)
                .padding([.leading, .trailing], 24)
            Spacer(minLength: 24)
            CardContentView(viewModel: viewModel, gamesImg: gamesImg)
            Spacer(minLength: 24)
            CardRatingView(rating: rating, ratingCount: ratingCount)
            Spacer(minLength: 16)
            CardPricingView(price: price, priceDuration: priceDuration)
            Spacer(minLength: 16)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}
