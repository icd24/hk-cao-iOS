//
//  extensions.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

extension Bundle {
    var baseURL: String {
        return object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
    }
    
    var baseServicePath: String {
        return object(forInfoDictionaryKey: "SERVICE_PATH") as? String ?? ""
    }
}
