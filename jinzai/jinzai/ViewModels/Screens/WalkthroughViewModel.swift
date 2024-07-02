//
//  TutorialViewModel.swift
//  jinzai
//
//  Created by HieuNV on 29/06/2024.
//

import SwiftUI

class WalkthroughViewModel: ObservableObject {
    func onGoToLogin() {
        // TODO: will go to login screen
        AppState.shared.currentScreen = .home
    }
    
    func onRegister() {
        // TODO: will go to register screen
        AppState.shared.currentScreen = .home
    }
}
