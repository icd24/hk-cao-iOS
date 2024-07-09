//
//  HeaderCommon.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/07.
//

import SwiftUI

struct HeaderCommon: View {
    @StateObject var viewModel: HeaderCommonModel
    
    var body: some View {
            ZStack {
                VStack {
                    Spacer().frame(height: 10)
                    HStack {
                        Spacer().frame(width: 20)
                        if !viewModel.isLeftHeader {
                            Spacer().frame(width: 20)
                            Spacer()
                        }
                        Image("img_title_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                        Spacer()
                        if viewModel.isShowMenu {
                            Image("ico_menu")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                            Spacer().frame(width: 20)
                        }
                    }
                    Spacer()
                }
                .background(
                    Rectangle()
                        .fill(AppColors.textWhite)
                        .shadow(color: AppColors.shadow10, radius: 2, x: 0, y: 4)
                )
                .overlay(
                    Group {
                        if viewModel.isMasked {
                            AppColors.maskColor.edgesIgnoringSafeArea(.top)
                        }
                    }
                )
            }
    }
}
