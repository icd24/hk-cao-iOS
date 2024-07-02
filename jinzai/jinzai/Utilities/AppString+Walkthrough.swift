//
//  AppString+Walkthrough.swift
//  jinzai
//
//  Created by HieuNV on 29/06/2024.
//

import Foundation

extension AppString {
    struct WalkthroughString: Identifiable {
        var id = UUID()
        var number: String
        var title: String
        var content: String
    }
    
    static let walkthrough: [WalkthroughString] = [
        WalkthroughString(
            number: "01",
            title: "キャリアシートが\nほぼタップのみで作れる",
            content: "出品する際に必要なキャリアシートは、簡単な操作で完成します。"
        ),
        WalkthroughString(
            number: "02",
            title: "求人を待つだけ",
            content: "キャリアシート登録後は、企業からのオファーを待つだけ。"
        ),
        WalkthroughString(
            number: "03",
            title: "独自の視点で\n企業の特徴を確認できる",
            content: "企業の特徴を知ることで、年収だけにとらわれない転職活動が可能です。"
        ),
    ]
}
