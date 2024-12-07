//
//  UserData.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import Foundation

class UserData: ObservableObject {
    @Published var users: [UserModel] = []
    
    init() {
        
    }
}
