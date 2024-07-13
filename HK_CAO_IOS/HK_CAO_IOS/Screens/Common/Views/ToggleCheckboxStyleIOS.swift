//
//  ToggleCheckBoxStyleIOS.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct ToggleCheckboxStyleIOS: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(AppColors.hyperLink)
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 0)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                configuration.label
                    .padding(.trailing, 10)
            }
        })
    }
}
