//
//  TutorialAuctionView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/07.
//

import SwiftUI

struct TutorialAuctionView: View {
    @StateObject var viewModel: TutorialAuctionViewModel
    let ds: DimensionSupport = DimensionSupport.shared
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("ico_auction_mini")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 23 * ds.vRatio)
                    Text(AppString.tutorialAuctionTitle)
                        .font(Font.system(size: 12 * ds.hRatio))
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .foregroundColor(.textWhite)
                }
                Text(AppString.tutorialAuctionContent)
                    .font(Font.system(size: 16 * ds.hRatio))
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(.textWhite)
                
            }
            .padding(.vertical, 12 * ds.vRatio)
            .padding(.horizontal, 20 * ds.hRatio)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.tutorialAuction)
        .overlay(
            Group {
                if viewModel.isMasked {
                    Color.mask
                }
            }
        )
    }
}

#Preview {
    TutorialAuctionView(viewModel: TutorialAuctionViewModel())
}
