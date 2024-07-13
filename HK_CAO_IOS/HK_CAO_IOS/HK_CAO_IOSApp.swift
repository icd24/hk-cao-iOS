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
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    
    var body: some Scene {
        _ = NetworkUtility.shared   // for network available or not first time
        return WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let servicePath = Bundle.main.path(forResource: Bundle.main.baseServicePath, ofType: "plist") ?? ""
        guard let fileOpts = FirebaseOptions(contentsOfFile: servicePath) else {
            fatalError("error service path")
        }
        FirebaseApp.configure(options: fileOpts)
        
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
        Messaging.messaging().delegate = self
        
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
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        PrintLog.log(message: "Got messaging firebase: \(messaging)")
        if fcmToken != nil {
            AppState.shared.deviceToken = fcmToken!
        }
        else {
            PrintLog.log(message: "cannot get fcm token")
        }
    }
}
