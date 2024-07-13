//
//  TutorialAuctionView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/07.
//

import SwiftUI

struct TutorialOthersView: View {
    let ds: DimensionSupport = DimensionSupport.shared
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("ico_interview_mini")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 23 * ds.vRatio)
                    Text(AppString.tutorialOthersInterviewTitle)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .fontWeight(.bold)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                }
                Text(AppString.tutorialOthersInterviewContent)
                    .font(Font.system(size: 12 * ds.hRatio))
                    .lineLimit(1)
                    .foregroundColor(AppColors.textDark)
                
                Rectangle()
                    .fill(AppColors.main300)
                    .frame(height: 1)
                    .padding(.vertical, 4 * ds.vRatio)
                HStack {
                    Image("ico_message_mini")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 23 * ds.vRatio)
                    Text(AppString.tutorialOthersMessageTitle)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .fontWeight(.bold)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                }
                Text(AppString.tutorialOthersMessageContent)
                    .font(Font.system(size: 12 * ds.hRatio))
                    .lineLimit(1)
                    .foregroundColor(AppColors.textDark)
                
                Rectangle()
                    .fill(AppColors.main300)
                    .frame(height: 1)
                    .padding(.vertical, 4 * ds.vRatio)
                HStack(spacing: 0) {
                    Image("ico_walking_mini")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 23 * ds.vRatio)
                    Text(AppString.tutorialOthersWalkingTitle)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .fontWeight(.bold)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                    Image("ico_info")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 14 * ds.vRatio)
                }
                HStack(alignment: .bottom, spacing: 0) {
                    Text(AppString.tutorialOthersWalkingContent1)
                        .font(Font.system(size: 16 * ds.hRatio))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                    Text(AppString.tutorialOthersWalkingContent2)
                        .font(Font.system(size: 12 * ds.hRatio))
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                }
                Spacer()
            }
            .padding(.horizontal, 20 * ds.vRatio)
            .padding(.vertical, 10 * ds.vRatio)
        }
        .background(AppColors.mainWhite)
        .frame(maxHeight: .infinity)
        .overlay(
            Group {
                    AppColors.maskColor
            }
        )
    }
}

#Preview {
    TutorialOthersView()
}
