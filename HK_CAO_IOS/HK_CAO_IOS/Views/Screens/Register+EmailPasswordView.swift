//
//  Register+EmailPassword.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/09.
//

import SwiftUI

struct Register_EmailPasswordView: View {
    @ObservedObject var viewModel: RegisterViewModel
    @FocusState private var isFocusedTextField: Bool
    
    var body: some View {
        let headerViewModel: HeaderCommonModel = HeaderCommonModel()
        headerViewModel.isLeftHeader = true
        headerViewModel.isShowMenu = false
        
        return GeometryReader { geometry in
            VStack (alignment: .leading, spacing: 0) {
                HeaderCommon(viewModel: headerViewModel)
                    .frame(height: 10)
                    .background(AppColors.mainWhite)
                Spacer().frame(height: 30)
                
                VStack(alignment: .leading) {
                    Text(AppString.registerEmailPasswordTitle)
                        .font(Font.system(size: 16))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .foregroundColor(AppColors.main)
                        .padding(.bottom, 20)
                    
                    VStack(alignment: .leading) {
                        // Email field
                        Text(AppString.loginMailAddress)
                            .font(Font.system(size: 16))
                            .foregroundColor(AppColors.textFieldTitle)
                        
                        TextField("", text: $viewModel.email)
                            .focused($isFocusedTextField)
                            .padding()
                            .frame(height: 40)
                            .background(AppColors.inputBackground)
                            .foregroundColor(AppColors.textFieldTitle)
                            .cornerRadius(5)
                            .padding(.top, 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(AppColors.main, lineWidth: 1)
                            )
                        
                        // Password field
                        Text(AppString.loginPassword)
                            .font(Font.system(size: 16))
                            .foregroundColor(AppColors.textFieldTitle)
                        
                        SecureField("", text: $viewModel.password)
                            .focused($isFocusedTextField)
                            .padding()
                            .frame(height: 40)
                            .background(AppColors.inputBackground)
                            .foregroundColor(AppColors.textFieldTitle)
                            .cornerRadius(5)
                            .padding(.top, 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(AppColors.main, lineWidth: 1)
                            )
                        
                        Button {
                            isFocusedTextField = false
                            viewModel.onRegisterEmailPassword()
                        } label: {
                            Text(AppString.registerEmailPasswordNextButton)
                                .font(Font.system(size: 20, weight: .bold))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(AppColors.main)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .padding(.vertical, 20)
                        }
                        
                        Button(action: {
                            viewModel.onTermOfService()
                        }, label: {
                            HStack(spacing: 0) {
                                TextBubblePointer()
                                    .fill(AppColors.main)
                                    .frame(width: 9, height: 6)
                                    .rotationEffect(Angle(degrees: 90))
                                    .offset(y: -1)
                                Text(AppString.registerEmailPasswordTermOfService)
                                    .underline()
                                    .font(Font.system(size: 16))
                                    .foregroundColor(AppColors.hyperLink)
                                    .padding(.bottom, 4)
                            }
                        })
                        
                        Text(AppString.registerEmailPasswordDescription)
                            .font(Font.system(size: 14))
                            .foregroundColor(Color.red)
                            .lineLimit(10)
                            .padding()
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(AppColors.textWhite)
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(AppColors.registerDescriptionBorder, lineWidth: 5)
                                }
                            )
                        
                        Button(action: {
                            viewModel.onForgotPassword()
                        }, label: {
                            Text(AppString.loginForgotPassword)
                                .underline()
                                .font(Font.system(size: 16, weight: .bold))
                                .foregroundColor(AppColors.hyperLink)
                                .padding(.top, 10)
                        })
                    }
                    .padding(.all, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(AppColors.textWhite)
                            .shadow(color: AppColors.shadow30, radius: 3, x: 0, y: 0)
                    )
                }
                .padding(.horizontal, 20)
            }
            .background(AppColors.backgroundRegister)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
