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
    static func login(username: String, password: String, completionHandler: @escaping DRRequestHandler) {
        let parameters: [String: Any] = [
            "email": username,
            "password": password,
            "deviceToken": AppState.shared.deviceToken,
            "deviceType": "IOS"
        ]
        
        ApiManager.callJsonAPI(api: loginUrl, parameter: parameters) { dic, res, error in
            completionHandler(dic, res, error)
        }
    }
}