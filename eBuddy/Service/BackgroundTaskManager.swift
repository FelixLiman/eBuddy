//
//  BackgroundTaskManager.swift
//  eBuddy
//
//  Created by Felix Liman on 07/12/24.
//

import SwiftUI

class BackgroundTaskManager {
    var backgroundTaskID: UIBackgroundTaskIdentifier = .invalid
    
    func startBackgroundTask(task: (() -> Void))  {
        backgroundTaskID = UIApplication.shared.beginBackgroundTask {
            print("Background task about to expire with \(UIApplication.shared.backgroundTimeRemaining)")
            UIApplication.shared.endBackgroundTask(self.backgroundTaskID)
        }
        
        task()
        print("Started background task with \(UIApplication.shared.backgroundTimeRemaining)")
    }
    
    func endBackgroundTask() {
        print("Ended background task")
        UIApplication.shared.endBackgroundTask(backgroundTaskID)
    }
}
