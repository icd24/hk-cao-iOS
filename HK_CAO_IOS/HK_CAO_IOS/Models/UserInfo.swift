//
//  UserInfo.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

struct UserInfo: Codable {
    let id: Int
    let expiresIn: String
    let accessToken: String
    let refreshToken: String
    let userName: String
    let email: String
    
    init?(dictionary: [String: Any], email: String?) {
        guard
            let id = dictionary["id"] as? Int,
            let expiresIn = dictionary["expires_in"] as? String,
            let accessToken = dictionary["access_token"] as? String,
            let refreshToken = dictionary["refresh_token"] as? String,
            let userName = dictionary["user_name"] as? String,
            let email = email
        else {
            return nil
        }
        
        self.id = id
        self.expiresIn = expiresIn
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.userName = userName
        self.email = email
    }
}
