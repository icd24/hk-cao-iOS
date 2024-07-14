//
//  Register+GenderView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import SwiftUI

struct Register_LocationView: View {
    @ObservedObject var viewModel: RegisterViewModel
    @FocusState private var isFocusedTextField: Bool
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        let isDisabled = !viewModel.actionAvailable ||
        viewModel.prefecture == "" ||
        viewModel.address == ""
        
        return VStack {
            HeaderCommon(isLeftHeader: true, isShowMenu: false)
            InfoStepView(step: .profile)
            Spacer().frame(height: 10 * ds.vRatio)
            
            VStack {
                Text(AppString.registerLocationSelect)
                    .font(.system(size: 20 * ds.hRatio, weight: .bold))
                    .foregroundColor(AppColors.main)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer().frame(height: 32 * ds.vRatio)
                
                
                VStack(alignment: .leading) {
                    // portal code field
                    HStack {
                        Text(AppString.registerLocationPortalCode)
                            .font(Font.system(size: 14 * ds.hRatio))
                            .foregroundColor(AppColors.textFieldTitle)
                        Text(AppString.optional)
                            .font(.system(size: 12 * ds.hRatio))
                            .frame(width: 40 * ds.hRatio, height: 22 * ds.hRatio)
                            .background(RoundedRectangle(cornerRadius: 11 * ds.hRatio)
                                .fill(AppColors.main200))
                            .foregroundColor(AppColors.main)
                            .overlay(
                                RoundedRectangle(cornerRadius: 11 * ds.hRatio)
                                    .stroke(AppColors.main300, lineWidth: 1)
                            )
                            .clipped()
                    }
                    
                    HStack {
                        TextField("", text: $viewModel.portalCode1)
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
                        TextField("", text: $viewModel.portalCode2)
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
                    }
                    
                    if let portalCodeError = viewModel.portalCodeError {
                        Text(portalCodeError)
                            .font(Font.system(size: 16 * ds.hRatio))
                            .foregroundColor(.red)
                            .padding(.bottom, 2 * ds.vRatio)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer().frame(height: 10 * ds.vRatio)
                    
                    // prefecture field
                    Text(AppString.registerLocationPrefecture)
                        .font(Font.system(size: 14 * ds.hRatio))
                        .foregroundColor(AppColors.textFieldTitle)
                    
                    TextField("", text: $viewModel.prefecture)
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
                    
                    if let prefectureError = viewModel.prefectureError {
                        Text(prefectureError)
                            .font(Font.system(size: 14 * ds.hRatio))
                            .foregroundColor(.red)
                            .padding(.bottom, 2 * ds.vRatio)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer().frame(height: 10 * ds.vRatio)
                    
                    // address field
                    Text(AppString.registerLocationAddress)
                        .font(Font.system(size: 14 * ds.hRatio))
                        .foregroundColor(AppColors.textFieldTitle)
                    
                    TextField("", text: $viewModel.address)
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
                    
                    if let addressError = viewModel.addressError {
                        Text(addressError)
                            .font(Font.system(size: 14 * ds.hRatio))
                            .foregroundColor(.red)
                            .padding(.bottom, 2 * ds.vRatio)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer().frame(height: 10 * ds.vRatio)
                    
                    Text(AppString.registerLocationNote1)
                        .font(.system(size: 14 * ds.hRatio))
                        .foregroundColor(AppColors.main)
                    Text(AppString.registerLocationNote2)
                        .font(.system(size: 14 * ds.hRatio))
                        .foregroundColor(AppColors.main)
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
                        viewModel.onRegisterLocation()
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
    Register_LocationView(viewModel: RegisterViewModel())
}
