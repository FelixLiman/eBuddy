//
//  CardRatingView.swift
//  Card
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct CardRatingView: View {
    var rating: Double
    var ratingCount: Int
    
    init(rating: Double?, ratingCount: Int?) {
        self.rating = rating ?? 0
        self.ratingCount = ratingCount ?? 0
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Image("ic_star")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .padding([.leading], 18)
            Text(String(format: "%.2f", rating))
                .font(.system(size: 20, weight: .bold))
                .padding([.leading], 8)
            Text("(\(ratingCount))")
                .font(.system(size: 20))
                .foregroundStyle(.gray)
                .padding([.leading], 8)
            Spacer()
        }
    }
}

#Preview {
    CardRatingView(rating: 4.9, ratingCount: 61)
}
