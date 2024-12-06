//
//  ContentView.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        List(viewModel.users, id: \.id) { user in
            VStack(alignment: .leading) {
                Text("\(user.uid ?? "")")
                Text("\(user.email ?? "")")
                Text("\(user.phoneNumber ?? "")")
                Text("\(user.gender?.asString() ?? "")")
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    ContentView()
}
