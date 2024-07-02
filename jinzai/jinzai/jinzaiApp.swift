//
//  jinzaiApp.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

@main
struct jinzaiApp: App {
    @StateObject var appState = AppState.shared
    var body: some Scene {
        _ = NetworkUtility.shared   // for network available or not first time
        return WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
