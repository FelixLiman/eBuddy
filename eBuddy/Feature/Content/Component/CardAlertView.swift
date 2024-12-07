//
//  CardAlertView.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct CardAlertView: View {
    var body: some View {
        ZStack {
            HStack {
                Image("ic_lightning")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundStyle(Color.white)
                    .frame(width: 24, height: 24)
                Text("Available Today")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.white)
            }
            .padding([.top, .bottom], 16)
            .padding([.leading, .trailing], 24)
            .background {
                TransparentBlurView()
                    .blur(radius: 20, opaque: true)
            }
            .clipShape(Capsule())
        }
    }
}

#Preview {
    CardAlertView()
}
