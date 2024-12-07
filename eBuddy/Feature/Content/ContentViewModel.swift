//
//  ContentViewModel.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI
import FirebaseFirestore

final class ContentViewModel: ObservableObject {
    private var firestoreService = FirestoreService()
    private var backgroundTaskManager = BackgroundTaskManager()
    @Published private(set) var isFetching = false
    @ObservedObject var userData: UserData
    @Published var showUserData: [UserModel]
    
    init(userData: UserData) {
        self.userData = userData
        self.showUserData = []
    }
    
    func setupToAddUser(count: Int) {
        //MARK: Fake Background with Timer, because Firebase Storage isnt Free anymore.
        backgroundTaskManager.startBackgroundTask {
            self.addUser(count: count)
        }
    }
    
    private func addUser(count: Int) {
        guard count > 1
        else {
            self.updateUserData()
            backgroundTaskManager.endBackgroundTask()
            return
        }
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.firestoreService.addUser { [weak self] userModel in
                self?.userData.users.append(userModel)
                debugPrint("Current there is \(self?.userData.users.count ?? 0) users")
                self?.addUser(count: count - 1)
            }
        }
    }
    
    func fetchUsers() {
        isFetching = true
        firestoreService.fetchUsers { [weak self] users in
            self?.isFetching = false
            self?.userData.users = users
            self?.showUserData = Array(users.prefix(3))
        }
    }
    
    func fetchOrderedUsers() {
        isFetching = true
        firestoreService.fetchOrderedUsers { [weak self] users in
            self?.isFetching = false
            self?.userData.users = users
            self?.showUserData = Array(users.prefix(3))
        }
    }
    
    private func updateUserData() {
        showUserData = Array(userData.users.prefix(3))
    }
    
    func discardAndUpdate() {
        userData.users = Array(userData.users.dropFirst())
        showUserData = Array(userData.users.prefix(3))
    }
}
