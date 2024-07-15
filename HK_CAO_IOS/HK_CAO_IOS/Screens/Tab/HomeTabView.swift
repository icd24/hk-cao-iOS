//
//  HomeTabView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct HomeTabView: View {
    @StateObject var viewModel: HomeTabViewModel
    
    var body: some View {
        return AppTabView(viewModel: viewModel, views: [
            AppTabBarItem(view: TermOfServiceView(viewModel: TermOfServiceViewModel())
                                .tag(0),
                          image: "tab_top",
                          title: AppString.TabTopItem,
                          action: {
                              viewModel.previousTab = HomeTabViewModel.topTabIndex
                          }
            ),
            AppTabBarItem(view: CareerSheetView()
                                .tag(1),
                          image: "tab_career_sheet",
                          title: AppString.TabCareerSheetItem,
                          action: {
                              viewModel.previousTab = HomeTabViewModel.careerSheetTabIndex
                          }
            ),
            AppTabBarItem(view: InterviewView()
                                .tag(2),
                          image: "tab_interview",
                          title: AppString.TabInterviewItem,
                          action: {
                              viewModel.previousTab = HomeTabViewModel.interviewTabIndex
                          }
            ),
            AppTabBarItem(view: AuctionView()
                                .tag(3),
                          image: "tab_auction",
                          title: AppString.TabAuctionItem,
                          action: {
                              viewModel.previousTab = HomeTabViewModel.auctionTabIndex
                          }
            ),
            AppTabBarItem(view: MessageView()
                                .tag(4),
                          image: "tab_message",
                          title: AppString.TabMessageItem,
                          action: {
                              viewModel.previousTab = HomeTabViewModel.messageTabIndex
                          }
            )
            
        ])
        .accentColor(.main)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = UIColor.tabUnselect
        }
    }
}

#Preview {
    HomeTabView(viewModel: HomeTabViewModel())
}
