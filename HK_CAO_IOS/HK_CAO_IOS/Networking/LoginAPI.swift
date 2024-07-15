//
//  LoginApi.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation
import SwiftUI

class LoginApi {
    static private let loginUrl = "/api/login"
    static func login(username: String, password: String) async throws -> LoginResponseModel {
        do {
            let parameters: LoginRequestModel = LoginRequestModel(
                username: username,
                password: password,
                deviceToken: AppState.shared.deviceToken
            )
            
            let encoder = JSONEncoder()
            let requestData = try encoder.encode(parameters)
            
            return try await ApiManager.post(url: loginUrl, data: requestData)
        } catch {
            throw ApiError.invalidParameters
        }
    }
}
