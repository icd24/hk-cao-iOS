//
//  AppString.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct AppString {
    static func localizedString(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    // tab item
    static let TabTopItem = localizedString(key: "TabTopItem")
    static let TabCareerSheetItem = localizedString(key: "TabCareerSheetItem")
    static let TabInterviewItem = localizedString(key: "TabInterviewItem")
    static let TabAuctionItem = localizedString(key: "TabAuctionItem")
    static let TabMessageItem = localizedString(key: "TabMessageItem")
    
    // button
    static let loginBtn = localizedString(key: "loginBtn")
    static let registerButton = localizedString(key: "registerButton")
    static let okContent = localizedString(key: "okContent")
    static let cancel = localizedString(key: "cancel")
    static let back = localizedString(key: "back")
    static let next = localizedString(key: "next")
    static let careerSheetChangeButton = localizedString(key: "careerSheetChangeButton")
    
    // common
    static let optional = localizedString(key: "optional")
    
    // TermOfService
    static let termOfServiceTitle = localizedString(key: "termOfServiceTitle")
    
    // Login
    static let loginMailAddress = localizedString(key: "loginMailAddress")
    static let loginPassword = localizedString(key: "loginPassword")
    static let loginForgotPassword = localizedString(key: "loginForgotPassword")
    static let loginForgotLoginId = localizedString(key: "loginForgotLoginId")
    static let loginRegister = localizedString(key: "loginRegister")
    
    // error message
    static let errorDefault = localizedString(key: "errorDefault")
    static let errorMailFormat = localizedString(key: "errorMailFormat")
    static let errorPassword = localizedString(key: "errorPassword")
    static let errorRequired = localizedString(key: "errorRequired")
}
