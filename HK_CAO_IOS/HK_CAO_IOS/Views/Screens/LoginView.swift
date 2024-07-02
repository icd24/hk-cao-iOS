//
//  LoginView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI
struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @FocusState private var isFocusedTextField: Bool
    
    var body: some View {
        return VStack {
            Text("loginScreen")
        }
        .background(AppColors.mainWhite)
    }
}
