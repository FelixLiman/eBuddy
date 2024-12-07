//
//  ContentView.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.userData.users, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text("\(user.uid ?? "")")
                    Text("\(user.email ?? "")")
                    Text("\(user.phoneNumber ?? "")")
                    Text("\(user.gender?.asString() ?? "")")
                }
            }
            .toolbar {
                ToolbarItem(id: "add", placement: .navigationBarTrailing) {
                    Button {
                        viewModel.setupToAddUser(count: 10)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}
