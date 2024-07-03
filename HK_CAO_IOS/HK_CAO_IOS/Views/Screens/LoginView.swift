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
        return VStack(alignment: .center) {
            Spacer()
            Image("img_login_logo")
                .resizable()
                .scaledToFit()
            
            Spacer().frame(height: 40)
            
            VStack(alignment: .leading) {
                // Email field
                Text(AppString.loginMailAddress)
                    .padding(.top, 20)
                    .font(Font.system(size: 16))
                    .foregroundColor(AppColors.textFieldTitle)
                
                TextField("", text: $viewModel.username)
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
            }
            
            Button {
                isFocusedTextField = false
                viewModel.login()
            } label: {
                Text(AppString.loginBtn)
                    .font(Font.system(size: 20, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(AppColors.main)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.vertical, 20)
            }
            .disabled(!viewModel.actionAvailable)
            .opacity(viewModel.actionAvailable ? 1 : 0.5)
            
            Button(action: {
                viewModel.forgotPassword()
            }, label: {
                Text(AppString.loginForgotPassword)
                    .underline()
                    .font(Font.system(size: 16, weight: .bold))
                    .foregroundColor(AppColors.hyperLink)
                    .padding(.bottom, 4)
            })
            
            Button(action: {
                viewModel.forgotPassword()
            }, label: {
                Text(AppString.loginForgotLoginId)
                    .underline()
                    .font(Font.system(size: 16, weight: .bold))
                    .foregroundColor(AppColors.hyperLink)
            })
            
            Button {
                viewModel.register()
            } label: {
                Text(AppString.loginRegister)
                    .font(Font.system(size: 20, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(AppColors.mainWhite)
                            .shadow(color: AppColors.shadow30, radius: 5, x: 0, y: 0)
                    )
                    .foregroundColor(AppColors.main)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(AppColors.main, lineWidth: 1)
                    )
                    .padding(.top, 20)
            }
            
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .background(AppColors.mainWhite)
    }
}
