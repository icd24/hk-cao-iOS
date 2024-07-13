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
}
