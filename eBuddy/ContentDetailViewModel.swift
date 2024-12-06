//
//  ContentDetailViewModel.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI
import FirebaseStorage

final class ContentDetailViewModel: ObservableObject {
    @Published var user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
    
    func uploadImage() {
        let imageData = UIImage(named: "cat-\(Int.random(in: 1...5))")?.jpegData(compressionQuality: 1)
        let storageRef = Storage.storage().reference().child("\(Int(Date().timeIntervalSince1970)).jpg")
        
        debugPrint("Upload Image to Firebase Storage")
        storageRef.putData(imageData!) { (metadata, error) in
            guard error == nil,
                  metadata != nil
            else {
                debugPrint("Error uploading image to Firebase Storage")
                return
            }
            
            storageRef.downloadURL { url, error in
                guard error == nil,
                      let url = url
                else {
                    debugPrint("Error downloading image from Firebase Storage")
                    return
                }
                debugPrint(url.absoluteString)
            }
        }
        debugPrint("Upload Image to Firebase Storage - 2")
    }
}
