//
//  SplashView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        ZStack {
            Image("bg_light")
                .resizable()
                .scaledToFill()
                .opacity(0.8)
                .padding(.bottom, 200)
            Image("bg_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.bottom,200)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        viewModel.checkLoginStatus()
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.main)
    }
}
