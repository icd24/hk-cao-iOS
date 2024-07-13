//
//  RefreshTokenApi.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation
import SwiftUI

class RefreshTokenApi {
    static private let refreshTokenUrl = "/refresh-token"
    static func refreshToken(completionHandler: @escaping DRRequestHandler) {
        completionHandler(.success(Data()))
    }
}
