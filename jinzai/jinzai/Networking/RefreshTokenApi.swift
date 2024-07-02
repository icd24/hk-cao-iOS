//
//  RefreshTokenApi.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation
import SwiftUI

class RefreshTokenApi {
    static private let refreshTokenUrl = "/refresh-token"
    static func refreshToken(completionHandler: @escaping DRRequestHandler) {
        guard let userInfo = Preferences.shared.userInfo else {
            completionHandler(nil, nil, ApiError.tokenNotAvailable)
            return
        }
        
        let params: [String: Any] = [
            "refresh_token": userInfo.refreshToken,
            "phone_uuid": UIDevice.current.identifierForVendor!.uuidString
        ]
        ApiManager.callJsonAPI(api: refreshTokenUrl, parameter: params, isAuth: true) { dic, res, error in
            completionHandler(dic, res, error)
        }
    }
}
