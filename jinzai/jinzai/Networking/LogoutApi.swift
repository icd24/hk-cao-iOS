//
//  LogoutApi.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

class LogoutApi {
    static private let logoutUrl = "/logout"
    static func logout(completionHandler: @escaping DRRequestHandler) {
        ApiManager.callJsonAPI(api: logoutUrl, parameter: [:], isAuth: true) { dic, res, error in
            completionHandler(dic, res, error)
        }
    }
}
