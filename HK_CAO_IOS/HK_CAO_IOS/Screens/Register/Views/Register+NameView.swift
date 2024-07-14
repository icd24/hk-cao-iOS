//
//  Register+GenderView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import SwiftUI

struct Register_NameView: View {
    @ObservedObject var viewModel: RegisterViewModel
    @FocusState private var isFocusedTextField: Bool
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        let isDisabled = !viewModel.actionAvailable ||
        viewModel.firstName == "" ||
        viewModel.lastName == "" ||
        viewModel.kanaFirstName == "" ||
        viewModel.kanaLastName == ""
        return VStack {
            HeaderCommon(isLeftHeader: true, isShowMenu: false)
            InfoStepView(step: .profile)
            Spacer().frame(height: 10 * ds.vRatio)
            
            VStack {
                Text(AppString.registerNameSelect)
                    .font(.system(size: 20 * ds.hRatio, weight: .bold))
                    .foregroundColor(AppColors.main)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer().frame(height: 32 * ds.vRatio)
                
                
                VStack(alignment: .leading) {
                    // first name field
                    Text(AppString.registerNameFirst)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .foregroundColor(AppColors.textFieldTitle)
                    
                    TextField("", text: $viewModel.firstName)
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
                    
                    if let firstNameError = viewModel.firstNameError {
                        Text(firstNameError)
                            .font(Font.system(size: 16 * ds.hRatio))
                            .foregroundColor(.red)
                            .padding(.bottom, 2 * ds.vRatio)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer().frame(height: 10 * ds.vRatio)
                    
                    // last name field
                    Text(AppString.registerNameLast)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .foregroundColor(AppColors.textFieldTitle)
                    
                    TextField("", text: $viewModel.lastName)
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
                    
                    if let lastNameError = viewModel.lastNameError {
                        Text(lastNameError)
                            .font(Font.system(size: 16 * ds.hRatio))
                            .foregroundColor(.red)
                            .padding(.bottom, 2 * ds.vRatio)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer().frame(height: 10 * ds.vRatio)
                    
                    // first name kana field
                    Text(AppString.registerNameKanaFirst)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .foregroundColor(AppColors.textFieldTitle)
                    
                    TextField("", text: $viewModel.kanaFirstName)
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
                    
                    if let kanaFirstNameError = viewModel.kanaFirstNameError {
                        Text(kanaFirstNameError)
                            .font(Font.system(size: 16 * ds.hRatio))
                            .foregroundColor(.red)
                            .padding(.bottom, 2 * ds.vRatio)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer().frame(height: 10 * ds.vRatio)
                    
                    // last name kana field
                    Text(AppString.registerNameKanaLast)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .foregroundColor(AppColors.textFieldTitle)
                    
                    TextField("", text: $viewModel.kanaLastName)
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
                    
                    if let kanaLastNameError = viewModel.kanaLastNameError {
                        Text(kanaLastNameError)
                            .font(Font.system(size: 16 * ds.hRatio))
                            .foregroundColor(.red)
                            .padding(.bottom, 2 * ds.vRatio)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding(.all, 20 * ds.hRatio)
                .background(
                    RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                        .fill(AppColors.textWhite)
                        .shadow(color: AppColors.shadow30, radius: 3 * ds.hRatio, x: 0, y: 0)
                )
                
                
                Spacer()
                
                HStack {
                    Button {
                        viewModel.onBackStep()
                    } label: {
                        Text(AppString.back)
                            .font(Font.system(size: 20 * ds.hRatio, weight: .bold))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 48 * ds.vRatio)
                            .background(
                                RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                                    .fill(AppColors.mainWhite)
                                    .shadow(color: AppColors.shadow10, radius: 5 * ds.hRatio, x: 0, y: 0)
                            )
                            .foregroundColor(AppColors.main)
                    }
                    
                    Button {
                        viewModel.onRegisterName()
                    } label: {
                        Text(AppString.next)
                            .font(Font.system(size: 20 * ds.hRatio, weight: .bold))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 48 * ds.vRatio)
                            .background(
                                isDisabled ?
                                RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                                    .fill(AppColors.backgroundDisabledButton)
                                    .shadow(color: AppColors.shadow10, radius: 0, x: 0, y: 0)
                                :
                                RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                                    .fill(AppColors.mainWhite)
                                    .shadow(color: AppColors.shadow10, radius: 5 * ds.hRatio, x: 0, y: 0)
                            )
                            .foregroundColor(isDisabled ? AppColors.textDisabledButton : AppColors.main)
                    }
                    .disabled(
                        isDisabled
                    )
                }
            }
            .padding(.horizontal, 20 * ds.hRatio)
        }
    }
}

#Preview {
    Register_NameView(viewModel: RegisterViewModel())
}
