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
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        let headerViewModel: HeaderCommonModel = HeaderCommonModel()
        headerViewModel.isLeftHeader = true
        headerViewModel.isShowMenu = false
        
        return GeometryReader { geometry in
            VStack (alignment: .leading, spacing: 0) {
                HeaderCommon(viewModel: headerViewModel)
                    .frame(height: 10 * ds.vRatio)
                    .background(AppColors.mainWhite)
                Spacer().frame(height: 30 * ds.vRatio)
                
                VStack(alignment: .leading) {
                    Text(AppString.registerEmailPasswordTitle)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .foregroundColor(AppColors.main)
                        .padding(.bottom, 20 * ds.vRatio)
                    
                    VStack(alignment: .leading) {
                        // Email field
                        Text(AppString.loginMailAddress)
                            .font(Font.system(size: 16 * ds.hRatio))
                            .foregroundColor(AppColors.textFieldTitle)
                        
                        TextField("", text: $viewModel.email)
                            .focused($isFocusedTextField)
                            .padding()
                            .frame(height: 40 * ds.vRatio)
                            .background(AppColors.inputBackground)
                            .foregroundColor(AppColors.textFieldTitle)
                            .cornerRadius(5 * ds.hRatio)
                            .padding(.top, 5 * ds.vRatio)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5 * ds.hRatio)
                                    .stroke(AppColors.main, lineWidth: 1)
                            )
                        
                        if let emailError = viewModel.emailError {
                            Text(emailError)
                                .font(Font.system(size: 16 * ds.hRatio))
                                .foregroundColor(.red)
                                .padding(.bottom, 2 * ds.vRatio)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        // Password field
                        Text(AppString.loginPassword)
                            .font(Font.system(size: 16 * ds.hRatio))
                            .foregroundColor(AppColors.textFieldTitle)
                        
                        SecureField("", text: $viewModel.password)
                            .focused($isFocusedTextField)
                            .padding()
                            .frame(height: 40 * ds.vRatio)
                            .background(AppColors.inputBackground)
                            .foregroundColor(AppColors.textFieldTitle)
                            .cornerRadius(5 * ds.hRatio)
                            .padding(.top, 5 * ds.vRatio)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(AppColors.main, lineWidth: 1)
                            )
                        
                        if let passwordError = viewModel.passwordError {
                            Text(passwordError)
                                .font(Font.system(size: 16 * ds.hRatio))
                                .foregroundColor(.red)
                                .lineLimit(10)
                                .padding(.bottom, 2 * ds.vRatio)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        Button {
                            isFocusedTextField = false
                            viewModel.onRegisterEmailPassword()
                        } label: {
                            Text(AppString.registerEmailPasswordNextButton)
                                .font(Font.system(size: 20 * ds.hRatio, weight: .bold))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(AppColors.main)
                                .foregroundColor(.white)
                                .cornerRadius(12 * ds.hRatio)
                                .padding(.vertical, 20 * ds.vRatio)
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
                                    .font(Font.system(size: 16 * ds.hRatio))
                                    .foregroundColor(AppColors.hyperLink)
                                    .padding(.bottom, 4 * ds.vRatio)
                            }
                        })
                        
                        Text(AppString.registerEmailPasswordDescription)
                            .font(Font.system(size: 14 * ds.hRatio))
                            .foregroundColor(Color.red)
                            .lineLimit(10)
                            .padding()
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10 * ds.hRatio)
                                        .fill(AppColors.textWhite)
                                    RoundedRectangle(cornerRadius: 10 * ds.hRatio)
                                        .stroke(AppColors.registerDescriptionBorder, lineWidth: 5 * ds.hRatio)
                                }
                            )
                        
                        Button(action: {
                            viewModel.onForgotPassword()
                        }, label: {
                            Text(AppString.loginForgotPassword)
                                .underline()
                                .font(Font.system(size: 16 * ds.hRatio, weight: .bold))
                                .foregroundColor(AppColors.hyperLink)
                                .padding(.top, 10 * ds.vRatio)
                        })
                    }
                    .padding(.all, 20 * ds.hRatio)
                    .background(
                        RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                            .fill(AppColors.textWhite)
                            .shadow(color: AppColors.shadow30, radius: 3 * ds.hRatio, x: 0, y: 0)
                    )
                }
                .padding(.horizontal, 20 * ds.hRatio)
            }
            .background(AppColors.backgroundRegister)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
