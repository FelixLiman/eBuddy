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
    @ObservedObject var userData: UserData
    
    init(userData: UserData) {
        self.userData = userData
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
            backgroundTaskManager.endBackgroundTask()
            return
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            self.firestoreService.addUser { [weak self] userModel in
                self?.userData.users.append(userModel)
                debugPrint("Current there is \(self?.userData.users.count ?? 0) users")
                self?.addUser(count: count - 1)
            }
        }
    }
    
    func fetchUsers() {
        firestoreService.fetchUsers { [weak self] users in
            self?.userData.users = users
        }
    }
}
