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
                            SplashView(viewModel: SplashViewModel())
                                .navigationBarHidden(true)
                        }
                    case .walkthrough:
                        WalkthroughView(viewModel: WalkthroughViewModel())
                    case .login:
                        LoginView(viewModel: appState.loginViewModel)
                    case .home:
                        HomeTabView(viewModel: HomeTabViewModel())
                    case .forgotPassword:
                        ForgotPasswordView(viewModel: ForgotPasswordViewModel())
                    case .tutorial:
                        TutorialView(viewModel: TutorialViewModel())
                    case .termOfService:
                        TermOfServiceView(viewModel: TermOfServiceViewModel())
                    case .register:
                        RegisterView(viewModel: RegisterViewModel())
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
            .onAppear {
                DimensionSupport.shared.updateRatio(geometry: geometry)
            }
        }
    }
}

#Preview {
    ContentView()
}
