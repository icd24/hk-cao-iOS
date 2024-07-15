//
//  LoginViewModels.swift
//  HK_CAO_IOS
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
        Task {
            guard actionAvailable else {
                return
            }

            guard validation() else {
                return
            }

            // TODO: Act like login success
            AppState.shared.currentScreen = .tutorial
            return
            // TODO: End act like login success

            actionAvailable = false
            do {
                let response = try await LoginApi.login(username: username, password: password)
                // TODO: Handle response
            } catch {
                // TODO: Handle errors
            }
        }
    }
    
    func forgotPassword() {
        AppState.shared.currentScreen = .forgotPassword
    }
    
    func forgotUserId() {
        // TODO: Go to forgot user id screen
        AppState.shared.currentScreen = .forgotPassword
    }

    func register() {
        AppState.shared.currentScreen = .register
    }
    
    func validation() -> Bool {
        usernameError = Validation.validationEmail(email: username, fieldName: AppString.loginMailAddress)
        passwordError = Validation.validationPassword(password: password, fieldName: AppString.loginPassword)
        
        return usernameError == nil && passwordError == nil
    }
    
    private func clearLoginInfo() {
        username = ""
        password = ""
        usernameError = nil
        passwordError = nil
    }
}
