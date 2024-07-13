//
//  Validation.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

class Validation {
    static let maxEmailLength = 50          // TODO: Need specific with spec
    static let minPasswordLength = 8        // TODO: Need specific with spec
    static let maxPasswordLength = 255      // TODO: Need specific with spec
    
    static let emailErrorText = AppString.errorMailFormat
    static let passwordErrorText = AppString.errorPassword
    
    static func validationEmail(email: String?, fieldName: String) -> String? {
        if let errorRequired = validationRequired(value: email, fieldName: fieldName) {
            return errorRequired
        }
        
        if validationMaxLength(value: email!, maxLength: maxEmailLength, fieldName: fieldName) != nil {
            return "＊\(fieldName)\(emailErrorText)"
        }
        
        if validationEmailFormatCheck(value: email!, fieldName: fieldName) != nil {
            return "＊\(fieldName)\(emailErrorText)"
        }
        
        return nil
    }
    
    static func validationPassword(password: String?, fieldName: String) -> String? {
        if let errorRequired = validationRequired(value: password, fieldName: fieldName) {
            return errorRequired
        }
        
        if validationMaxLength(value: password!, maxLength: maxPasswordLength, fieldName: fieldName) != nil {
            return "＊\(fieldName)\(passwordErrorText)"
        }
        
        if validationPasswordFormatCheck(value: password!, fieldName: fieldName) != nil {
            return "＊\(fieldName)\(passwordErrorText)"
        }
        
        return nil
    }
    
    static func validationRequired(value: String?, fieldName: String) -> String? {
        guard let value = value, !value.isEmpty else {
            return "＊\(fieldName)\(AppString.errorRequired)"
        }
        return nil
    }
    
    static func validationMinLength(value: String, minLength: Int, fieldName: String) -> String? {
        if value.count < minLength {
            return "Please input \(fieldName) more than\(minLength) characters"
        }
        return nil
    }
    
    static func validationMaxLength(value: String, maxLength: Int, fieldName: String) -> String? {
        if value.count > maxLength {
            return "Please input \(fieldName) less than \(maxLength) characters"
        }
        return nil
    }
    
    static func validationEmailFormatCheck(value: String, fieldName: String) -> String? {
        let emailRegex = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: value) {
            return fieldName + emailErrorText
        }
        
        return nil
    }
    
    static func validationPasswordFormatCheck(value: String, fieldName: String) -> String? {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if !passwordPredicate.evaluate(with: value) {
            return fieldName + passwordErrorText
        }
        
        return nil
    }
}
