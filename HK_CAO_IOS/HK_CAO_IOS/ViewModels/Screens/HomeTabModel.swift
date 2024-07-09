//
//  HomeTabModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

class HomeTabViewModel: ObservableObject {
    static let noneTabIndex = -1
    static let topTabIndex = 0
    static let careerSheetTabIndex = 1
    static let interviewTabIndex = 2
    static let auctionTabIndex = 3
    static let messageTabIndex = 4

//    @Published var topViewModel = TopViewModel()
    @Published var isMasked: Bool = false
    @Published var selectedTab: Int = HomeTabViewModel.topTabIndex
    @Published var previousTab: Int = HomeTabViewModel.topTabIndex
    
    func logout() {
        if Preferences.shared.userInfo != nil {
            
        }
    }
}
