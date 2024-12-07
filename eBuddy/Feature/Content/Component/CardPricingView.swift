//
//  CardPricingView.swift
//  Card
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct CardPricingView: View {
    @Environment(\.colorScheme) var colorScheme
    let nominal: String
    let decimal: String
    
    init(price: Double?) {
        nominal = "\(price ?? 0)".components(separatedBy: ".").first ?? ""
        decimal = "\(price ?? 0)".components(separatedBy: ".").last ?? ""
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Image(colorScheme == .dark ? "ic_mana_dark" : "ic_mana")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .padding([.leading], 18)
            HStack(alignment: .bottom, spacing: 0) {
                Text(nominal)
                    .font(.system(size: 24, weight: .bold))
                    .padding([.leading], 8)
                Text(".\(decimal)/1Hr")
                    .font(.system(size: 16))
                    .padding([.bottom], 3)
            }
            Spacer()
        }
    }
}

#Preview {
    CardPricingView(price: 110.00)
}
