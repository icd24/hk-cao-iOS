//
//  ForgotPasswordViewModel.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var emailError: String?
    @Published var actionAvailable: Bool = true
    @Published var isSentEmail: Bool = false
    
    func forgotPassword() {
        guard actionAvailable else {
            return
        }
        
        guard validation() else {
            return
        }
        
        actionAvailable = false
        
        ResetPasswordApi.resetPassword(email: email) { dic, _, error in
            self.actionAvailable = true
            if let err = error {
                ErrorHandler.handler.handleApiError(error: err, dict: dic)
                return
            }
            
            guard let status: String = dic?["status_code"] as? String, status == ErrorHandler.successCode
            else {
                ErrorHandler.handler.handleApiError(error: error, dict: dic)
                return
            }
            
            self.isSentEmail = true
            self.email = ""
            self.emailError = nil
        }
    }
    
    func returnToLogin() {
        AppState.shared.currentScreen = .login
        self.isSentEmail = false
        self.email = ""
        self.emailError = nil
    }

    func validation() -> Bool {
        return emailError == nil
    }
}
