//
//  FirestoreService.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import Foundation
import FirebaseFirestore

final class FirestoreService {
    private let database = Firestore.firestore().collection("USERS")
    
    func addUser(completion: ((UserModel) -> Void)? = nil) {
        let documentId = String.random(length: 20)
        let documentData: [String: Any] = [
            "uid": documentId,
            "email": "example@\(documentId).com",
            "phone": "+62 \(documentId)",
            "ge": UserGender.random().rawValue
        ]
        self.database.document(documentId).setData(documentData, completion: { error in
            guard error == nil else {
                debugPrint("Error adding Firestore Data: \(error?.localizedDescription ?? "")")
                return
            }
            
            let user = UserModel(uid: documentId,
                                 email: documentData["email"] as? String,
                                 phoneNumber: documentData["phone"] as? String,
                                 gender: documentData["ge"] as? Int ?? 0)
            completion?(user)
        })
    }
    
    func fetchUsers(completion: (([UserModel]) -> Void)? = nil) {
        var users: [UserModel] = []
        database.getDocuments { snapshot, error  in
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
}
