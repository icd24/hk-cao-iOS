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

    var body: some View {
        GeometryReader { geometry in
            VStack
            {
                ZStack {
                    Image("bg_walkthrough")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width - 20)
                    
                    TabView {
                        ForEach(AppString.walkthrough) {walkthrough in
                            VStack(alignment: .leading) {
                                Spacer().frame(height: 130)
                                Text(walkthrough.number)
                                    .font(Font.system(size: 80))
                                    .fontWeight(.bold)
                                    .padding(.all, 20)
                                    .foregroundColor(AppColors.textWhite)
                                    .frame(width: geometry.size.width, alignment: .leading)
                                Text(walkthrough.title)
                                    .font(Font.system(size: 24))
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 10)
                                    .lineLimit(2)
                                    .foregroundColor(AppColors.textWhite)
                                    .frame(width: geometry.size.width, alignment: .leading)
                                Text(walkthrough.content)
                                    .font(Font.system(size: 16))
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 20)
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
                    Spacer(minLength: 15)
                    Button {
                        viewModel.onGoToLogin()
                    } label: {
                        Text(AppString.loginBtn)
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(AppColors.main)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(AppColors.textWhite)
                                    .shadow(color: AppColors.shadow30, radius: 10, x: 0, y: 0)
                            )
                    }
                    Spacer()
                    Button {
                        viewModel.onRegister()
                    } label: {
                        Text(AppString.registerButton)
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(AppColors.textWhite)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(AppColors.main)
                            )
                    }
                    
                    Spacer(minLength: 15)
                }
            }
            .background(AppColors.backgroundWhite)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
