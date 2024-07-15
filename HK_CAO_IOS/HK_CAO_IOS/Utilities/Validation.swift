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
    static let phoneNumberLength = 11       // TODO: Need specific with spec
    
    static let errorDefault = AppString.errorDefault
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
    
    static func validationPortalCode(code: String?, length: Int, fieldName: String) -> String? {
        if code == nil || code == "" {
            return nil
        }
        if let errorNumber = validationNumber(value: code!, fieldName: fieldName)
        {
            return errorNumber
        }
        
        if let errorLength = validationFixLength(value: code!, length: length, fieldName: fieldName) {
            return errorLength
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
    
    static func validationNumber(value: String, fieldName: String) -> String? {
        let numberRegex = "^[0-9]+$"
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", numberRegex)
        if !numberPredicate.evaluate(with: value) {
            return fieldName + errorDefault
        }
        
        return nil
    }
    
    static func validationFixLength(value: String, length: Int, fieldName: String) -> String? {
        if value.count != length {
            return fieldName + errorDefault
        }
        
        return nil
    }

    static func validationPhoneNumber(value: String, fieldName: String) -> String? {
        if let errorRequired = validationRequired(value: value, fieldName: fieldName)
        {
            return errorRequired
        }
        
        // Regular expression to match digits and common phone number characters
        let phoneRegex = "^[0-9+*#(),;\\s]+$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        
        // Check if value matches the phone number regex
        if !phonePredicate.evaluate(with: value) {
            return fieldName + errorDefault
        }
        
        // Remove special characters to check length of only digits
        let digitsOnly = value.filter { "0123456789".contains($0) }
        if let errorPhoneLength = validationFixLength(value: digitsOnly, length: phoneNumberLength, fieldName: fieldName)
        {
            return errorPhoneLength
        }
        
        return nil
    }
}
