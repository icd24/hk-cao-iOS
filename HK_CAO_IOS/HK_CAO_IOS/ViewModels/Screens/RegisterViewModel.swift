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
    // Name input screen
    @Published var familyName: String = ""
    @Published var fullName: String = ""
    @Published var kanaFamilyName: String = ""
    @Published var kanaFullName: String = ""
    
    // Email password screen
    func onRegisterEmailPassword() {
        
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
