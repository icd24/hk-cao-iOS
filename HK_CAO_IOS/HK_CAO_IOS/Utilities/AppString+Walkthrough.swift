//
//  AppString+Walkthrough.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 29/06/2024.
//

import SwiftUI

extension AppString {
    struct WalkthroughString: Identifiable {
        var id = UUID()
        var number: String
        var title: String
        var content: String
    }
    
    static let walkthrough: [WalkthroughString] = [
        WalkthroughString(
            number: localizedString(key: "walkthrough1Number"),
            title: localizedString(key: "walkthrough1Title"),
            content: localizedString(key: "walkthrough1Content")
        ),
        WalkthroughString(
            number: localizedString(key: "walkthrough2Number"),
            title: localizedString(key: "walkthrough2Title"),
            content: localizedString(key: "walkthrough2Content")
        ),
        WalkthroughString(
            number: localizedString(key: "walkthrough3Number"),
            title: localizedString(key: "walkthrough3Title"),
            content: localizedString(key: "walkthrough3Content")
        )
    ]
}
