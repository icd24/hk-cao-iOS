//
//  LoginViewModels.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var usernameError: String?
    @Published var passwordError: String?
    @Published var actionAvailable: Bool = true
    @Published var storeLoginInformation: Bool = false {
        didSet {
            Preferences.shared.rememberLogin = storeLoginInformation
        }
    }
    
    /* 
        init function is used to initialize the view model.
        It is used to set the initial value for the properties.
        It also sets the username and password if the user has checked the remember checkbox.
        It removes the login info if the user has not checked the remember checkbox.
    */
    init() {
        storeLoginInformation = Preferences.shared.rememberLogin
    }

    func login() {
        guard actionAvailable else {
            return
        }
        
        guard validation() else {
            return
        }
        
        actionAvailable = false
    }
    
    func forgotPassword() {
        AppState.shared.currentScreen = .forgotPassword
    }

    func validation() -> Bool {
        return usernameError == nil && passwordError == nil
    }
    
    private func clearLoginInfo() {
        username = ""
        password = ""
        usernameError = nil
        passwordError = nil
    }
}
