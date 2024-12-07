//
//  CardHeaderView.swift
//  Card
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct CardHeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    let name: String
    let isOnline: Bool
    
    init(name: String?, isOnline: Bool?) {
        self.name = name ?? "Unknown"
        self.isOnline = isOnline ?? false
    }

    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 24, weight: .bold))
            Circle()
                .frame(width: 12, height: 12)
                .foregroundStyle(isOnline ? Color.green : Color.red)
            Spacer()
            Image("ic_verified")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .padding([.trailing], 12)
            Image("ic_social")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                .frame(width: 28, height: 28)
        }
    }
}

#Preview {
    CardHeaderView(name: "Felix", isOnline: false)
}
