//
//  CardPricingView.swift
//  Card
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct CardPricingView: View {
    let nominal: String
    let decimal: String
    let priceDuration: Int
    
    init(price: String, priceDuration: Int) {
        nominal = price.components(separatedBy: ".").first ?? ""
        decimal = price.components(separatedBy: ".").last ?? ""
        self.priceDuration = priceDuration
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Image("ic_mana")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .padding([.leading], 18)
            HStack(alignment: .bottom, spacing: 0) {
                Text(nominal)
                    .font(.system(size: 24, weight: .bold))
                    .padding([.leading], 8)
                Text(".\(decimal)/\(priceDuration)Hr")
                    .font(.system(size: 16))
                    .padding([.bottom], 3)
            }
            Spacer()
        }
    }
}

#Preview {
    CardPricingView(price: "100.00", priceDuration: 1)
}
