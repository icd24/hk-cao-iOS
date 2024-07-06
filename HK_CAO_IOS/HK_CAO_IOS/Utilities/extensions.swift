//
//  extensions.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

extension Bundle {
    var baseURL: String {
        return object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
    }
    
    var baseServicePath: String {
        return object(forInfoDictionaryKey: "SERVICE_PATH") as? String ?? ""
    }
}

extension Color {
    init(hex: UInt, opacity: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: opacity
        )
    }
}

extension UIColor {
    convenience init(hex: UInt, opacity: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex >> 16) & 0xff) / 255,
            green: CGFloat((hex >> 8) & 0xff) / 255,
            blue: CGFloat(hex & 0xff) / 255,
            alpha: opacity)
    }
}

extension String {
    func hexToInt() -> Int {
        return Int(self, radix: 16) ?? 0
    }
}

struct UnderlineTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .padding(.top, 1)
                    .background(AppColors.forgotPasswordLink),
                alignment: .bottom)
    }
}

extension View {
    func underlineText() -> some View {
        self.modifier(UnderlineTextModifier())
    }
}
