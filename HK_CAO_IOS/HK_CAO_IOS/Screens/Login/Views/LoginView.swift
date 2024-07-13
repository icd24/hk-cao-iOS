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
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        return VStack(alignment: .center) {
            Spacer()
            Image("img_login_logo")
                .resizable()
                .scaledToFit()
            
            Spacer().frame(height: 40 * ds.vRatio)
            
            VStack(alignment: .leading) {
                // Email field
                Text(AppString.loginMailAddress)
                    .padding(.top, 20 * ds.vRatio)
                    .font(Font.system(size: 16 * ds.hRatio))
                    .foregroundColor(AppColors.textFieldTitle)
                
                TextField("", text: $viewModel.username)
                    .focused($isFocusedTextField)
                    .padding()
                    .frame(height: 40 * ds.vRatio)
                    .background(AppColors.mainWhite)
                    .foregroundColor(AppColors.textFieldTitle)
                    .cornerRadius(5 * ds.hRatio)
                    .padding(.top, 5 * ds.vRatio)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5 * ds.hRatio)
                            .stroke(AppColors.main, lineWidth: 1)
                    )
                
                if let usernameError = viewModel.usernameError {
                    Text(usernameError)
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
                    .background(AppColors.mainWhite)
                    .foregroundColor(AppColors.textFieldTitle)
                    .cornerRadius(5 * ds.hRatio)
                    .padding(.top, 5 * ds.vRatio)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5 * ds.hRatio)
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
            }
            
            Button {
                isFocusedTextField = false
                viewModel.login()
            } label: {
                Text(AppString.loginBtn)
                    .font(Font.system(size: 20 * ds.hRatio, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(AppColors.main)
                    .foregroundColor(.white)
                    .cornerRadius(12 * ds.hRatio)
                    .padding(.vertical, 20 * ds.vRatio)
            }
            .disabled(!viewModel.actionAvailable)
            .opacity(viewModel.actionAvailable ? 1 : 0.5)
            
            Button(action: {
                viewModel.forgotPassword()
            }, label: {
                Text(AppString.loginForgotPassword)
                    .underline()
                    .font(Font.system(size: 16 * ds.hRatio, weight: .bold))
                    .foregroundColor(AppColors.hyperLink)
                    .padding(.bottom, 4 * ds.vRatio)
            })
            
            Button(action: {
                viewModel.forgotPassword()
            }, label: {
                Text(AppString.loginForgotLoginId)
                    .underline()
                    .font(Font.system(size: 16 * ds.hRatio, weight: .bold))
                    .foregroundColor(AppColors.hyperLink)
            })
            
            Button {
                viewModel.register()
            } label: {
                Text(AppString.loginRegister)
                    .font(Font.system(size: 20 * ds.hRatio, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                            .fill(AppColors.mainWhite)
                            .shadow(color: AppColors.shadow30, radius: 5 * ds.hRatio, x: 0, y: 0)
                    )
                    .foregroundColor(AppColors.main)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12 * ds.hRatio)
                            .stroke(AppColors.main, lineWidth: 1)
                    )
                    .padding(.top, 20 * ds.vRatio)
            }
            
            
            Spacer()
        }
        .padding(.horizontal, 30 * ds.hRatio)
        .background(AppColors.mainWhite)
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
