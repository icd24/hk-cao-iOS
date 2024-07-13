//
//  HeaderCommonModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/07.
//

import Foundation

class HeaderCommonModel: ObservableObject {
    @Published var isMasked: Bool = false
    @Published var isLeftHeader: Bool = false
    @Published var isShowMenu: Bool = true
    @Published var isShadow: Bool = true
}
