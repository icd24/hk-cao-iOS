//
//  AppTabView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct AppTabView: View {
    var views: [AppTabBarItem]
    @StateObject var viewModel: HomeTabViewModel
    
    init(viewModel: HomeTabViewModel, views: [AppTabBarItem]) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.views = views
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(Array(views.enumerated()), id: \.offset) { index, item in
                    item.view
                        .opacity(self.viewModel.selectedTab == index ? 1 : 0)
                        .padding(.bottom, 50)
                }
                
                VStack {
                    Spacer()
                    ZStack(alignment: .top) {
                        AppColors.tabBackground
                            .frame(height: 50 + geometry.safeAreaInsets.bottom)
                        
                        HStack(spacing: 2) {
                            ForEach(Array(views.enumerated()), id: \.element.title) { index, item in
                                Button(
                                    action: {
                                        withAnimation(.easeInOut) { self.viewModel.selectedTab = index }
                                        item.action?()
                                    },
                                    label: {
                                        VStack(spacing: 4) {
                                            if self.viewModel.selectedTab == index {
                                                Image(item.image)
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(AppColors.tabAccent)
                                                    .frame(
                                                        width: 22,
                                                        height: 22
                                                    )
                                                Text(item.title)
                                                    .foregroundColor(AppColors.tabAccent)
                                                    .font(
                                                        Font.system(
                                                            size: 10, weight: .bold))
                                            } else {
                                                Image(item.image)
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(AppColors.tabUnselect)
                                                    .frame(
                                                        width: 22,
                                                        height: 22
                                                    )
                                                Text(item.title)
                                                    .foregroundColor(AppColors.tabUnselect)
                                                    .font(
                                                        Font.system(
                                                            size: 10,
                                                            weight: .bold
                                                        )
                                                    )
                                            }
                                        }
                                        .padding(.vertical, 5)
                                        .frame(maxWidth: .infinity, maxHeight: 44)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(self.viewModel.selectedTab == index ? AppColors.mainWhite : AppColors.transparent)
                                        )
                                    }
                                )
                                
                            }
                        }
                        .padding(.top, 5)
                        .padding(.horizontal, 10)
                    }
                    .overlay(
                        Group {
                            if viewModel.isMasked {
                                AppColors.maskColor.edgesIgnoringSafeArea(.bottom)
                            }
                        }
                    )
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct AppTabBarItem {
    var view: AnyView
    var image: String
    var title: String
    var action: (() -> Void)?
    
    init<V: View>(view: V, image: String, title: String, action: (() -> Void)? = nil) {
        self.view = AnyView(view)
        self.image = image
        self.title = title
        self.action = action
    }
}

#Preview {
    AppTabView(viewModel: HomeTabViewModel(), views: [])
}
