//
//  SplashViewModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var isCheckingLogin = true {
        didSet {
            self.nextScreen()
        }
    }
    @Published var isLoggedIn = false {
        didSet {
            self.nextScreen()
        }
    }
    
    func checkLoginStatus() {
        if let userInfo = Preferences.shared.userInfo { // check user info stored in userdefault
            let expiresIn = userInfo.expiresIn
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
            
            // check expireIn stored in userdefault with valid date
            if let expiresInFormatter = dateFormatter.date(from: expiresIn) {
                let currentDate = Date()
                // check expireIn stored in userdefault after current date (not expired)
                if expiresInFormatter > currentDate {
                    self.isLoggedIn = true
                    self.isCheckingLogin = false
                } else { // in case expireIn stored in userdefault before current date (expired)
                    refreshToken()
                }
            } else { // in case expireIn stored in userdefault not valid date
                refreshToken()
            }
        } else { // in case user info not stored in userdefault
            self.isCheckingLogin = false
        }
    }

    func refreshToken() {
        // TODO: Implement later
    }
    
    func nextScreen() {
        if !self.isCheckingLogin && AppState.shared.currentScreen == .splash {
            if self.isLoggedIn {
                AppState.shared.currentScreen = .home
                // clear flow list for remove login flow
                AppState.shared.flowScreenList.removeAll()
            } else {
                AppState.shared.currentScreen = .walkthrough
            }
        }
    }
}
