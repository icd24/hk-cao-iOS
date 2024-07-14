//
//  HeaderCommon.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/07.
//

import SwiftUI

struct HeaderCommon: View {
    var isMasked: Bool = false
    var isLeftHeader: Bool = false
    var isShowMenu: Bool = true
    var isShadow: Bool = true
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Spacer().frame(height: 10)
                    HStack {
                        Spacer().frame(width: 20)
                        if !isLeftHeader {
                            Spacer().frame(width: 20)
                            Spacer()
                        }
                        Image("img_title_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                        Spacer()
                        if isShowMenu {
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
                        if isMasked {
                            AppColors.maskColor.edgesIgnoringSafeArea(.top)
                        }
                    }
                )
            }
            .frame(height: 10 * ds.vRatio)
            .background(AppColors.mainWhite)
            Spacer().frame(height: 30 * ds.vRatio)
        }
    }
}

#Preview {
    HeaderCommon()
}
