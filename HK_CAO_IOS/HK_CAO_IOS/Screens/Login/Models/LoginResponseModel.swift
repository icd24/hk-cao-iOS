//
//  LoginResponseModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import Foundation

// TODO: need implement
struct LoginResponseModel: Codable {
    let message: String
    let data: LoginResponse
}

struct LoginResponse: Codable {
    let token: String
}
