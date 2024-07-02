//
//  ContentView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    // rewrite body with appState.currentScreen
    var body: some View {
        return GeometryReader { geometry  in
            ZStack {
                    switch appState.currentScreen {
                    case .splash:
                        NavigationView {
                            SplashView(viewModel: appState.splashViewModel)
                                .navigationBarHidden(true)
                                .environmentObject(appState)
                        }
                    case .walkthrough:
                        WalkthroughView(viewModel: appState.walkthroughModel)
                            .environmentObject(appState)
                    case .login:
                        LoginView(viewModel: appState.loginViewModel)
                            .environmentObject(appState)
                    case .home:
                        HomeTabView(viewModel: appState.homeTabViewModel)
                            .environmentObject(appState)
                    case .forgotPassword:
                        ForgotPasswordView(viewModel: appState.forgotPasswordViewModel)
                            .environmentObject(appState)
                    }
                
                if appState.isAlertPresented {
                    AppAlertView(
                        title: appState.alert.title ?? "",
                        description: appState.alert.content ?? "",
                        cancelAction: appState.alert.onCancel,
                        cancelActionTitle: appState.alert.cancelButton,
                        primaryAction: appState.alert.onOk,
                        primaryActionTitle: appState.alert.okButton
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
