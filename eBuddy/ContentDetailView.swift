//
//  ContentDetailView.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

struct ContentDetailView: View {
    @ObservedObject var viewModel: ContentDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(viewModel.user.uid ?? "")")
            Text("\(viewModel.user.email ?? "")")
            Text("\(viewModel.user.phoneNumber ?? "")")
            Text("\(viewModel.user.gender?.asString() ?? "")")
        }
        .onAppear {
            viewModel.uploadImage()
        }
    }
}
