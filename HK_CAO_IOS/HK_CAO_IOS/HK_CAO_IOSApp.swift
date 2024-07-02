//
//  HK_CAO_IOSApp.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

@main
struct HK_CAO_IOSApp: App {
    @StateObject var appState = AppState.shared
    var body: some Scene {
        _ = NetworkUtility.shared   // for network available or not first time
        return WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
