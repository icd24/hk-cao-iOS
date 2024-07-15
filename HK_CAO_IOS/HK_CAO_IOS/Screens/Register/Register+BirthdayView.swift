//
//  Register+GenderView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import SwiftUI

struct Register_BirthdayView: View {
    @ObservedObject var viewModel: RegisterViewModel
    @FocusState private var isFocusedTextField: Bool
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        let isDisabled = !viewModel.actionAvailable 
        
        return VStack {
            HeaderCommon(isLeftHeader: true, isShowMenu: false)
            InfoStepView(step: .profile)
            Spacer().frame(height: 10 * ds.vRatio)
            
            VStack {
                Text(AppString.registerBirthdaySelect)
                    .font(.system(size: 20 * ds.hRatio, weight: .bold))
                    .foregroundColor(.main)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer().frame(height: 32 * ds.vRatio)
                
                VStack(alignment: .leading) {
                    // phone field
                    Text(AppString.registerBirthdayTitle)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .foregroundColor(.textFieldTitle)
                    
                    DatePicker(AppString.pleaseSelect, selection: $viewModel.birthday, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .clipped()
                        
                    
                    TextField("", text: $viewModel.phone)
                        .focused($isFocusedTextField)
                        .keyboardType(.phonePad)
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
                    
                    Spacer().frame(height: 10 * ds.vRatio)
                    
                    Text(AppString.registerBirthdayNote)
                        .font(.system(size: 14 * ds.hRatio))
                        .foregroundColor(.main)
                }
                .padding(.all, 20 * ds.hRatio)
                .background(
                    RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                        .fill(.textWhite)
                        .shadow(color: .shadow30, radius: 3 * ds.hRatio, x: 0, y: 0)
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
                                    .fill(.mainWhite)
                                    .shadow(color: .shadow10, radius: 5 * ds.hRatio, x: 0, y: 0)
                            )
                            .foregroundColor(.main)
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
                                    .fill(.backgroundDisabledButton)
                                    .shadow(color: .shadow10, radius: 0, x: 0, y: 0)
                                :
                                    RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                                    .fill(.mainWhite)
                                    .shadow(color: .shadow10, radius: 5 * ds.hRatio, x: 0, y: 0)
                            )
                            .foregroundColor(isDisabled ? .textDisabledButton : .main)
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
    Register_BirthdayView(viewModel: RegisterViewModel())
}
