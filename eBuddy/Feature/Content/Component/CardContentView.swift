//
//  CardContentView.swift
//  Card
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct CardContentView: View {
    var viewModel: ContentViewModel
    var avatarImg: String
    var gameImg: String
    var moreGameImg: String
    
    init(viewModel: ContentViewModel, gamesImg: [String]) {
        self.viewModel = viewModel
        self.avatarImg = "img_gamer_girl"
        self.gameImg = gamesImg.first ?? ""
        self.moreGameImg = gamesImg.dropFirst().first ?? ""
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .bottom) {
                Image(avatarImg)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(32)
                    .padding([.bottom], 48)
                HStack(alignment: .center) {
                    ZStack(alignment: .leading) {
                        Image(gameImg)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundStyle(Color.white)
                            .frame(width: 96, height: 96)
                            .clipShape(Circle())
                            .alignmentGuide(.leading) { dim in
                                dim[HorizontalAlignment.center] + 24
                            }
                        
                        Image(moreGameImg)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundStyle(Color.white)
                            .frame(width: 96, height: 96)
                            .clipShape(Circle())
                            .overlay(
                                ZStack {
                                    Circle()
                                        .fill(Color.black.opacity(0.6))
                                        .stroke(.white, lineWidth: 4)
                                    Text("+3")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 30))
                                        .foregroundStyle(Color.white)
                                }
                            )
                    }
                    Spacer()
                    Button {
                        viewModel.setupToAddUser(count: 10)
                    } label: {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.purple, .pink, .orange]), startPoint: .bottomLeading, endPoint: .topTrailing)
                                )
                                .frame(width: 96, height: 96)
                                .cornerRadius(48)
                                .clipShape(RoundedRectangle(cornerRadius: 48))
                            Image("ic_voice")
                                .renderingMode(.template)
                                .resizable()
                                .foregroundStyle(Color.white)
                                .frame(width: 56, height: 56)
                        }.alignmentGuide(.leading) { d in
                            d[HorizontalAlignment.center]
                        }
                    }
                }
                .padding([.leading, .trailing], 16)
            }
            CardAlertView()
            .padding([.top], 16)
            .padding([.leading], 24)
        }
    }
}

//#Preview {
//    CardContentView(gamesImg: ["img_game1", "img_game2"])
//}
