//
//  LogoutApi.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

class LogoutApi {
    static private let logoutUrl = "/logout"
    
    static func logout() async throws -> LogoutResponseModel {
        try await ApiManager.post(url: logoutUrl)
    }
}
