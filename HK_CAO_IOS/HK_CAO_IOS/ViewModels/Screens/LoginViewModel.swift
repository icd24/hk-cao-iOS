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
        guard actionAvailable else {
            return
        }
        
        guard validation() else {
            return
        }
        
        actionAvailable = false
        
        LoginApi.login(username: username, password: password) { dic, _, error in
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
            
            guard let data: [String: Any] = dic?["data"] as? [String: Any]
            else {
                AppState.showAlert(title: AppString.errorDefault)
                return
            }
            
            let userInfo = UserInfo(dictionary: data, email: self.username)
            Preferences.shared.userInfo = userInfo
            
            self.clearLoginInfo()
            AppState.shared.currentScreen = .home
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
        // TODO: Go to register screen
        AppState.shared.currentScreen = .home
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
