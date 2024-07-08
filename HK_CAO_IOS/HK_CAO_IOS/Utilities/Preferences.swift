//
//  Preferences.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

class Preferences {
    static let shared = Preferences()
    
    private let userDefaults = UserDefaults.standard
    private let showedTutorialViewKey = "showedTutorialView"
    private let userInfoKey = "userInfo"
    private let loginInfoKey = "loginInfo"
    private let rememberLoginKey = "rememberLogin"
    private let logsKey: String = "logs"
    
    var userInfo: UserInfo? {
        get {
            if let data = userDefaults.data(forKey: userInfoKey),
               let userInfo = try? JSONDecoder().decode(UserInfo.self, from: data) {
                return userInfo
            }
            return nil
        }
        set {
            if let newValue = newValue,
               let data = try? JSONEncoder().encode(newValue) {
                userDefaults.set(data, forKey: userInfoKey)
            } else {
                userDefaults.removeObject(forKey: userInfoKey)
            }
        }
    }
    
    var rememberLogin: Bool {
        get {
            return userDefaults.bool(forKey: rememberLoginKey)
        }
        set {
            userDefaults.set(newValue, forKey: rememberLoginKey)
        }
    }
    
    var showedTutorialView: Bool {
        get {
            return userDefaults.bool(forKey: showedTutorialViewKey)
        }
        set {
            userDefaults.set(newValue, forKey: showedTutorialViewKey)
        }
    }
}
