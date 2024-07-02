//
//  ForgotPasswordView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject var viewModel: ForgotPasswordViewModel
    
    var body: some View {
        let isFlexibleSize = viewModel.emailError != nil
        
        return VStack {
            
        }
        .padding()
        .background(AppColors.main)
    }
}
