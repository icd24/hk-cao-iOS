//
//  AppAlertView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct AppAlertView<Content: View>: View {
    let title: String
    let description: String

    var cancelAction: (() -> Void)?
    var cancelActionTitle: String?

    var primaryAction: (() -> Void)?
    var primaryActionTitle: String?

    var customContent: Content?

    init(title: String,
         description: String,
         cancelAction: (() -> Void)? = nil,
         cancelActionTitle: String? = nil,
         primaryAction: (() -> Void)? = nil,
         primaryActionTitle: String? = nil,
         customContent: Content? = EmptyView()) {
        self.title = title
        self.description = description
        self.cancelAction = cancelAction
        self.cancelActionTitle = cancelActionTitle
        self.primaryAction = primaryAction
        self.primaryActionTitle = primaryActionTitle
        self.customContent = customContent
    }

    var body: some View {
        HStack {
            VStack(spacing: 0) {
                if title.count > 0 {
                    Text(title)
                        .font(.system(size: 19, weight: .bold, design: .default))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                }
                    
                if description.count > 0 {
                    Text(description)
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                }

                customContent

                HStack(spacing: 20) {
                    if let cancelAction, let cancelActionTitle {
                        Button { cancelAction() } label: {
                            Text(cancelActionTitle)
                                .font(.system(
                                    size: 19,
                                    weight: .regular, design: .default)
                                )
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                .frame(height: 50)
                                .foregroundColor(AppColors.inputText)
                                .background(Color.clear)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(AppColors.inputText, lineWidth: 2)
                                )
                        }
                    }

                    if let primaryAction, let primaryActionTitle {
                        Button { primaryAction() } label: {
                            Text("**\(primaryActionTitle)**")
                                .font(.system(
                                    size: 20,
                                    weight: .bold, design: .default
                                ))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                .frame(height: 50)
                                .foregroundColor(Color.white)
                                .background(AppColors.main)
                                .cornerRadius(10)
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
                .padding(.all, 20)
            }
            .frame(width: 345, alignment: .center)
            .background(.ultraThickMaterial)
            .cornerRadius(30)
            .padding([.trailing, .leading], 15)
        }
        .zIndex(1000)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(AppColors.maskColor)
    }
}
