//
//  AppState.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var currentScreen: Screen = .splash
    
    @Published var isAlertPresented: Bool = false
    @Published var alert: AlertState = AlertState()
    
    @Published var deviceToken: String = ""
    
    @Published var splashViewModel = SplashViewModel()
    @Published var walkthroughModel = WalkthroughViewModel()
    @Published var termOfServiceModel = TermOfServiceViewModel()
    @Published var loginViewModel = LoginViewModel()
    @Published var forgotPasswordViewModel = ForgotPasswordViewModel()
    @Published var homeTabViewModel = HomeTabViewModel()
    
    static let shared = AppState()
    
    static func showAlert(title: String? = nil,
                          content: String? = nil,
                          okButtonTitle: String = AppString.okContent,
                          cancelButtonTitle: String? = nil,
                          onOk: (() -> Void)? = nil,
                          onCancel: (() -> Void)? = nil) {
        let appState = AppState.shared
        appState.alert = AlertState(
            title: title,
            content: content,
            okButtonTitle: okButtonTitle,
            cancelButtonTitle: cancelButtonTitle,
            onOk: {
                appState.isAlertPresented = false
                onOk?()
            },
            onCancel: {
                appState.isAlertPresented = false
                onCancel?()
            }
        )
        appState.isAlertPresented = true
    }
    
    func logoutAction() {
        Preferences.shared.userInfo = nil
        splashViewModel.isLoggedIn = false
        currentScreen = .splash
        splashViewModel = SplashViewModel()
        loginViewModel = LoginViewModel()
        forgotPasswordViewModel = ForgotPasswordViewModel()
    }
}

struct AlertState {
    var title: String?
    var content: String?
    var okButton: String
    var cancelButton: String?
    var onOk: (() -> Void)?
    var onCancel: (() -> Void)?
    
    init(title: String? = nil,
         content: String? = nil,
         okButtonTitle: String = AppString.okContent,
         cancelButtonTitle: String? = nil,
         onOk: (() -> Void)? = nil,
         onCancel: (() -> Void)? = nil) {
        self.title = title
        self.content = content
        self.okButton = okButtonTitle
        self.cancelButton = cancelButtonTitle
        self.onOk = onOk
        self.onCancel = onCancel
    }
}

enum Screen {
    case splash
    case walkthrough
    case login
    case home
    case forgotPassword
}
