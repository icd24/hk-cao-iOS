//
//  LoginRequestModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import Foundation

struct LoginRequestModel: Codable {
    let username: String
    let password: String
    let deviceToken: String
    var deviceType: String = "IOS"
}
