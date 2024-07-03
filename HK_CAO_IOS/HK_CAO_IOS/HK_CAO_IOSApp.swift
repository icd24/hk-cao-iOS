//
//  HK_CAO_IOSApp.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI
import Firebase
import UserNotifications

@main
struct HK_CAO_IOSApp: App {
    @StateObject var appState = AppState.shared
    
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    
    var body: some Scene {
        _ = NetworkUtility.shared   // for network available or not first time
        return WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (granted, error) in
            if granted {
                PrintLog.log(message: "Notification authorization granted.")
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                PrintLog.log(message: "Notification authorization denied.")
            }
        }
        // TODO: open this after got GoogleService-Info.plist
//        FirebaseApp.configure()
        
        return true
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Convert device token to string
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        PrintLog.log(message: "Device Token: \(token)")
        AppState.shared.deviceToken = token
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        PrintLog.log(message: "Failed to register: \(error)")
    }
}
