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
                    .foregroundColor(.textFieldTitle)
                
                TextField("", text: $viewModel.username)
                    .focused($isFocusedTextField)
                    .padding()
                    .frame(height: 40 * ds.vRatio)
                    .background(.mainWhite)
                    .foregroundColor(.textFieldTitle)
                    .cornerRadius(5 * ds.hRatio)
                    .padding(.top, 5 * ds.vRatio)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5 * ds.hRatio)
                            .stroke(.main, lineWidth: 1)
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
                    .foregroundColor(.textFieldTitle)
                
                SecureField("", text: $viewModel.password)
                    .focused($isFocusedTextField)
                    .padding()
                    .frame(height: 40 * ds.vRatio)
                    .background(.mainWhite)
                    .foregroundColor(.textFieldTitle)
                    .cornerRadius(5 * ds.hRatio)
                    .padding(.top, 5 * ds.vRatio)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5 * ds.hRatio)
                            .stroke(.main, lineWidth: 1)
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
                    .background(.main)
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
                    .foregroundColor(.hyperLink)
                    .padding(.bottom, 4 * ds.vRatio)
            })
            
            Button(action: {
                viewModel.forgotPassword()
            }, label: {
                Text(AppString.loginForgotLoginId)
                    .underline()
                    .font(Font.system(size: 16 * ds.hRatio, weight: .bold))
                    .foregroundColor(.hyperLink)
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
                            .fill(.mainWhite)
                            .shadow(color: .shadow30, radius: 5 * ds.hRatio, x: 0, y: 0)
                    )
                    .foregroundColor(.main)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12 * ds.hRatio)
                            .stroke(.main, lineWidth: 1)
                    )
                    .padding(.top, 20 * ds.vRatio)
            }
            
            
            Spacer()
        }
        .padding(.horizontal, 30 * ds.hRatio)
        .background(.mainWhite)
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
