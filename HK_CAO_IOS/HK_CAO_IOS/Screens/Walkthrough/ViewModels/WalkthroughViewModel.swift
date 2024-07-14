//
//  TutorialViewModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 29/06/2024.
//

import SwiftUI

class WalkthroughViewModel: ObservableObject {
    func onGoToLogin() {
        AppState.shared.currentScreen = .login
    }
    
    func onRegister() {
        AppState.shared.currentScreen = .register
    }
}
