//
//  TutorialView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/06.
//

import SwiftUI

struct TutorialView: View {
    @ObservedObject var viewModel: TutorialViewModel
    let ds: DimensionSupport = DimensionSupport.shared
    
    init(viewModel: TutorialViewModel) {
        self.viewModel = viewModel
        self.viewModel.tabViewModel.isMasked = true
    }
    
    var confirmTutorialView: some View {
        let isMasked = viewModel.step != .Tutorial
        return VStack {
            Spacer()
            HStack {
                Spacer()
                if !isMasked {
                    TextBubble(
                        subText: AppString.tutorialActiveConfirmContent,
                        direction: .trailing
                    )
                }
                Image("ico_confirm_tutorial")
                    .resizable()
                    .scaledToFit()
                    .frame(height: isMasked ? 68 * ds.vRatio : 75 * ds.vRatio)
                    .background(
                        isMasked 
                        ?
                        RoundedRectangle(cornerRadius: 0)
                            .fill(AppColors.mainWhite)
                            .shadow(color: AppColors.shadow30, radius: 0, x: 0, y: 0)
                        :
                            RoundedRectangle(cornerRadius: 12 * ds.hRatio)
                            .fill(AppColors.mainWhite)
                            .shadow(color: AppColors.shadowRound, radius: 12 * ds.hRatio, x: 0, y: 0)
                    )
                    .overlay(
                        Group {
                            if isMasked {
                                AppColors.maskColor.edgesIgnoringSafeArea(.bottom)
                            }
                        }
                    )
                Spacer().frame(width: 10 * ds.hRatio)
            }
            Spacer().frame(height: 20 * ds.vRatio)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var careerSheetStepView: some View {
        TextBubble(
            mainText: AppString.tutorialActiveCareerTitle,
            subText: AppString.tutorialActiveCareerContent,
            direction: .top
        )
    }
    
    var auctionStepView: some View {
        TextBubble(
            mainText: AppString.tutorialActiveAuctionTitle,
            subText: AppString.tutorialActiveAuctionContent,
            direction: .top
        )
    }
    
    var tutorialView: some View {
        let headerViewModel: HeaderCommonModel = HeaderCommonModel()
        headerViewModel.isMasked = true
        headerViewModel.isShadow = false
        return GeometryReader { geometry in
            VStack (alignment: .leading, spacing: 0) {
                HeaderCommon(viewModel: headerViewModel)
                    .frame(height: 10 * ds.vRatio)
                Spacer().frame(height: 10 * ds.vRatio)
                
                TutorialCareerSheetView(viewModel: viewModel.tutorialCareerViewModel)
                    .zIndex(2.0)
                ZStack {
                    TutorialAuctionView(viewModel: viewModel.tutorialAuctionViewModel)
                        .zIndex(1.0)
                    if (viewModel.step == .StepCareerSheet)
                    {
                        careerSheetStepView
                            .zIndex(2.0)
                    }
                }
                ZStack {
                    TutorialOthersView()
                    if (viewModel.step == .Auction)
                    {
                        VStack {
                            auctionStepView
                            Spacer()
                        }
                    }
                    
                    confirmTutorialView
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .onTapGesture {
                viewModel.onNextStep()
            }
        }
    }
    
    var body: some View {
        return GeometryReader { geometry in
            AppTabView(viewModel: viewModel.tabViewModel, views: [
                AppTabBarItem(view: tutorialView
                    .tag(0),
                              image: "tab_top",
                              title: AppString.TabTopItem,
                              action: {
                              }
                ),
                AppTabBarItem(view: Spacer()
                    .tag(1),
                              image: "tab_career_sheet",
                              title: AppString.TabCareerSheetItem,
                              action: {
                              }
                ),
                AppTabBarItem(view: Spacer()
                    .tag(2),
                              image: "tab_interview",
                              title: AppString.TabInterviewItem,
                              action: {
                              }
                ),
                AppTabBarItem(view: Spacer()
                    .tag(3),
                              image: "tab_auction",
                              title: AppString.TabAuctionItem,
                              action: {
                              }
                ),
                AppTabBarItem(view: Spacer()
                    .tag(4),
                              image: "tab_message",
                              title: AppString.TabMessageItem,
                              action: {
                              }
                )
                
            ])
            .accentColor(AppColors.tabAccent)
            .onAppear {
                UITabBar.appearance().unselectedItemTintColor = AppColors.tabUnselectUI
            }
        }
    }
}

#Preview {
    TutorialView(viewModel: TutorialViewModel())
}
