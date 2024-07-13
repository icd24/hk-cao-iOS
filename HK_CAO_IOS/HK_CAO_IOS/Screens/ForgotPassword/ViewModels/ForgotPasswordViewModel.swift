//
//  ForgotPasswordViewModel.swift
//  HK_CAO_IOS
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
