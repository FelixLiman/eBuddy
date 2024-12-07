//
//  FirestoreService.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import Foundation
import FirebaseFirestore

final class FirestoreService {
    private static let database = Firestore.firestore().collection("USERS")
    
    func addUser(completion: ((UserModel) -> Void)? = nil) {
        let documentId = String.random(length: 20)
        let documentData: [String: Any] = [
            "uid": documentId,
            "name": String.random(length: 5),
            "online": Bool.random(),
            "games_played": ["img_game1", "img_game2"],
            "rating": trunc(Double.random(in: 0...5) * 100) / 100,
            "total_rating": Int.random(in: 0...1000),
            "price": trunc(Double.random(in: 10...1000) * 100) / 100,
            "email": "example@\(documentId).com",
            "phone": "+62 \(documentId)",
            "last_active": Int(Date().timeIntervalSince1970),
            "ge": UserGender.random().rawValue
        ]
        
        FirestoreService.database.document(documentId).setData(documentData, completion: { error in
            guard error == nil else {
                debugPrint("Error adding Firestore Data: \(error?.localizedDescription ?? "")")
                return
            }
            
            let user = UserModel(uid: documentId,
                                 name: documentData["name"] as? String,
                                 isOnline: documentData["online"] as? Bool,
                                 games: documentData["games_played"] as? [String],
                                 rating: documentData["rating"] as? Double,
                                 ratingCount: documentData["total_rating"] as? Int,
                                 price: documentData["price"] as? Double,
                                 email: documentData["email"] as? String,
                                 phoneNumber: documentData["phone"] as? String,
                                 recentlyActive: documentData["last_active"] as? Int,
                                 gender: documentData["ge"] as? Int ?? 0)
            completion?(user)
        })
    }
    
    func fetchUsers(with query: Query = FirestoreService.database, completion: (([UserModel]) -> Void)? = nil) {
        var users: [UserModel] = []
        query.getDocuments { snapshot, error  in
            guard error == nil else {
                debugPrint("Error getting Firestore Data: \(error?.localizedDescription ?? "")")
                return
            }
            guard let documents = snapshot?.documents else { return }
            
            for document in documents {
                do {
                    let user = try document.data(as: UserModel.self)
                    users.append(user)
                } catch {
                    debugPrint("Error parsing Document: \(error.localizedDescription)")
                }
            }
            
            completion?(users)
            debugPrint("Done Fetching Users")
        }
    }
    
    func fetchOrderedUsers(completion: (([UserModel]) -> Void)? = nil) {
        var query: Query = FirestoreService.database
        query = query.order(by: "last_active", descending: true)
        query = query.order(by: "rating", descending: true)
        query = query.whereField("ge", isEqualTo: 0)
        query = query.order(by: "price")
        
        fetchUsers(with: query, completion: completion)
    }
}
