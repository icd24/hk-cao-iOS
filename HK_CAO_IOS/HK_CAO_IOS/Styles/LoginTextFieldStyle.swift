//
//  BorderTextFieldStyle.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct LoginTextFieldStyle: TextFieldStyle {
    // swiftlint:disable identifier_name
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .foregroundColor(AppColors.inputText)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
    // swiftlint:enable identifier_name
}
