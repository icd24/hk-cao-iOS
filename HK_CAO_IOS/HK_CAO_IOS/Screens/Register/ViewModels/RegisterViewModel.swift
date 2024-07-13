//
//  RegisterViewModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/09.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var step: RegisterStep = .EmailPassword
    // Email password screen
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailError: String?
    @Published var passwordError: String?
    // Name input screen
    @Published var familyName: String = ""
    @Published var fullName: String = ""
    @Published var kanaFamilyName: String = ""
    @Published var kanaFullName: String = ""
    
    @Published var actionAvailable: Bool = true
    
    // Email password screen
    func onRegisterEmailPassword() {
        guard actionAvailable else {
            return
        }
        
        guard validationEmailPassword() else {
            return
        }
    }
    func validationEmailPassword() -> Bool {
        emailError = Validation.validationEmail(email: email, fieldName: AppString.loginMailAddress)
        passwordError = Validation.validationPassword(password: password, fieldName: AppString.loginPassword)
        
        return emailError == nil && passwordError == nil
    }
    func onTermOfService() {
        AppState.shared.currentScreen = .termOfService
    }
    func onForgotPassword() {
        AppState.shared.currentScreen = .forgotPassword
    }
    
    // Gender screen
    func onManSelect() {
        
    }
    func onWomanSelect() {
        
    }
    
    func onBackStep() {
        
    }
    
    func onNextStep() {
        
    }
}

enum RegisterStep: Int {
    case EmailPassword
    
}
