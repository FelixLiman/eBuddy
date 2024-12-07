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
            ZStack {
                if viewModel.isFetching {
                    Text("Fetching Data")
                } else {
                    Button {
                        viewModel.setupToAddUser(count: 10)
                    } label: {
                        VStack {
                            Text("You have swiped all the users!")
                            Text("Press here to add more users")
                        }
                    }
                }
                ForEach(viewModel.showUserData.reversed(), id: \.uid) { user in
                    Button {
                        viewModel.discardAndUpdate()
                    } label: {
                        CardView(viewModel: viewModel, user: user)
                            .shadow(color: (colorScheme == .dark ? Color.white : Color.black).opacity(0.4), radius: 8)
                            .padding()
                            .transition(.move(edge: .leading))
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchOrderedUsers()
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(userData: UserData()))
}
