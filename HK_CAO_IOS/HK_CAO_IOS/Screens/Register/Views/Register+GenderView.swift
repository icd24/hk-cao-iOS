//
//  Register+GenderView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import SwiftUI

struct Register_GenderView: View {
    @ObservedObject var viewModel: RegisterViewModel
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        VStack{
            HeaderCommon(isLeftHeader: true, isShowMenu: false)
            InfoStepView(step: .profile)
            Spacer().frame(height: 10 * ds.vRatio)
            Text(AppString.registerGenderSelect)
                .font(.system(size: 20 * ds.hRatio, weight: .bold))
                .foregroundColor(AppColors.main)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16 * ds.hRatio)
            Spacer().frame(height: 32 * ds.vRatio)
            
            Button {
                viewModel.onMaleSelect()
            } label: {
                Text(AppString.registerGenderMale)
                    .font(Font.system(size: 20 * ds.hRatio, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 94 * ds.vRatio)
                    .background(
                        RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                            .fill(AppColors.mainWhite)
                            .shadow(color: AppColors.shadow10, radius: 5 * ds.hRatio, x: 0, y: 0)
                    )
                    .foregroundColor(AppColors.main)
                    .padding(.horizontal, 16 * ds.hRatio)
            }
            Spacer().frame(height: 24 * ds.vRatio)
            Button {
                viewModel.onFemaleSelect()
            } label: {
                Text(AppString.registerGenderFemale)
                    .font(Font.system(size: 20 * ds.hRatio, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 94 * ds.vRatio)
                    .background(
                        RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                            .fill(AppColors.mainWhite)
                            .shadow(color: AppColors.shadow10, radius: 5 * ds.hRatio, x: 0, y: 0)
                    )
                    .foregroundColor(AppColors.main)
                    .padding(.horizontal, 16 * ds.hRatio)
            }
            
            Spacer()
        }
        .background(AppColors.backgroundRegister)
    }
}

#Preview {
    Register_GenderView(viewModel: RegisterViewModel())
}
