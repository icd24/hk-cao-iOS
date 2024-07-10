//
//  TutorialView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 29/06/2024.
//

import SwiftUI

struct WalkthroughView: View {
    @StateObject var viewModel: WalkthroughViewModel
    @State private var scrollToTop = false
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        GeometryReader { geometry in
            VStack
            {
                ZStack {
                    Image("bg_walkthrough")
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: geometry.size.width - 20 * ds.hRatio,
                            height: geometry.size.height - 40 * ds.vRatio + ds.edgeBottom
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8 * ds.hRatio))
                        .clipped()
                    
                    TabView {
                        ForEach(AppString.walkthrough) { walkthrough in
                            VStack(alignment: .leading) {
                                Spacer().frame(height: 130 * ds.vRatio)
                                Text(walkthrough.number)
                                    .font(Font.system(size: 80 * ds.hRatio))
                                    .fontWeight(.bold)
                                    .padding(.all, 20 * ds.hRatio)
                                    .foregroundColor(AppColors.textWhite)
                                    .frame(width: geometry.size.width, alignment: .leading)
                                Text(walkthrough.title)
                                    .font(Font.system(size: 24 * ds.hRatio))
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 20 * ds.hRatio)
                                    .padding(.bottom, 10 * ds.vRatio)
                                    .lineLimit(2)
                                    .foregroundColor(AppColors.textWhite)
                                    .frame(width: geometry.size.width, alignment: .leading)
                                Text(walkthrough.content)
                                    .font(Font.system(size: 16 * ds.hRatio))
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 20 * ds.hRatio)
                                    .lineLimit(2)
                                    .foregroundColor(AppColors.textWhite)
                                    .frame(width: geometry.size.width, alignment: .leading)
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
                .edgesIgnoringSafeArea(.all)
                
                HStack {
                    Spacer(minLength: 15 * ds.hRatio)
                    Button {
                        viewModel.onGoToLogin()
                    } label: {
                        Text(AppString.loginBtn)
                            .font(Font.system(size: 20 * ds.hRatio))
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.main)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48 * ds.vRatio)
                            .background(
                                RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                                    .fill(AppColors.textWhite)
                                    .shadow(color: AppColors.shadow30, radius: 10 * ds.hRatio, x: 0, y: 0)
                            )
                    }
                    Spacer()
                    Button {
                        viewModel.onRegister()
                    } label: {
                        Text(AppString.registerButton)
                            .font(Font.system(size: 20 * ds.hRatio))
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.textWhite)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48 * ds.vRatio)
                            .background(
                                RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                                    .fill(AppColors.main)
                            )
                    }
                    
                    Spacer(minLength: 15 * ds.hRatio)
                }
                
                Spacer().frame(height: ds.edgeBottom != 0 ? 0 : 10 * ds.vRatio)
            }
            .background(AppColors.backgroundWhite)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
