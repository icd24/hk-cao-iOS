//
//  TutorialAuctionView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/07.
//

import SwiftUI

struct TutorialAuctionView: View {
    @StateObject var viewModel: TutorialAuctionViewModel
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("ico_auction_mini")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 23)
                    Text(AppString.tutorialAuctionTitle)
                        .font(Font.system(size: 12))
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .foregroundColor(AppColors.textWhite)
                }
                Text(AppString.tutorialAuctionContent)
                    .font(Font.system(size: 16))
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(AppColors.textWhite)
                
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppColors.main)
        .overlay(
            Group {
                if viewModel.isMasked {
                    AppColors.maskColor
                }
            }
        )
    }
}
