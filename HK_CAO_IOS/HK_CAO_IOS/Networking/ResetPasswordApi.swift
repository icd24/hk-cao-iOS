//
//  ResetPasswordApi.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

class ResetPasswordApi {
    static private let resetPasswordUrl = "/forgot-password"

    static func resetPassword(email: String, completionHandler: @escaping DRRequestHandler) {
        let parameters: [String: Any] = [
            "email": email
        ]
        ApiManager.callJsonAPI(api: resetPasswordUrl, parameter: parameters) { dic, res, error in
            completionHandler(dic, res, error)
        }
    }
}
