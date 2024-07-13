//
//  LoginRequestModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import Foundation

struct LoginRequestModel: Codable {
    let username: Username
    let password: Password
    let deviceToken: String
    var deviceType: String = "IOS"
    
    struct Username: Codable {
        let email: String
        let format: Bool
    }
    
    struct Password: Codable {
        let value: String
        let createdBy: String
        let valid: Bool
    }
}
