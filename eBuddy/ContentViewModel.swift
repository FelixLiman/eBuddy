//
//  ContentViewModel.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI
import FirebaseFirestore

final class ContentViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    
    init() {
        
    }
    
    func fetchUsers() {
        Firestore.firestore().collection("USERS").getDocuments { snapshot, error  in
            guard error == nil else {
                debugPrint("Error getting Firestore Data: \(error?.localizedDescription ?? "")")
                return
            }
            guard let documents = snapshot?.documents else { return }
            
            for document in documents {
                do {
                    let user = try document.data(as: UserModel.self)
                    debugPrint("\(document.documentID) => \(document.data()) => \(user)")
                    self.users.append(user)
                } catch {
                    debugPrint("Error parsing Document: \(error.localizedDescription)")
                }
            }
        }
    }
}
