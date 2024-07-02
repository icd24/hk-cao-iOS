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
        RefreshTokenApi.refreshToken { dic, _, error in
            if error != nil {
                self.isCheckingLogin = false
                return
            }
            
            guard let status: String = dic?["status_code"] as? String,
                  status == ErrorHandler.successCode,
                  let data: [String: Any] = dic?["data"] as? [String: Any] else {
                self.isCheckingLogin = false
                return
            }
            
            let userInfo = UserInfo(dictionary: data, email: Preferences.shared.userInfo?.email)
            Preferences.shared.userInfo = userInfo
            self.isLoggedIn = true
            self.isCheckingLogin = false
        }
    }
    
    func nextScreen() {
        if !self.isCheckingLogin && AppState.shared.currentScreen == .splash {
            if self.isLoggedIn {
                AppState.shared.currentScreen = .home
            } else {
                AppState.shared.currentScreen = .walkthrough
            }
        }
    }
}
