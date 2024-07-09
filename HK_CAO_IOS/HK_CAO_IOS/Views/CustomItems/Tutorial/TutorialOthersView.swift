//
//  TutorialAuctionView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/07.
//

import SwiftUI

struct TutorialOthersView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("ico_interview_mini")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 23)
                    Text(AppString.tutorialOthersInterviewTitle)
                        .font(Font.system(size: 16))
                        .fontWeight(.bold)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                }
                Text(AppString.tutorialOthersInterviewContent)
                    .font(Font.system(size: 12))
                    .lineLimit(1)
                    .foregroundColor(AppColors.textDark)
                
                Rectangle()
                    .fill(AppColors.main300)
                    .frame(height: 1)
                    .padding(.vertical, 4)
                HStack {
                    Image("ico_message_mini")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 23)
                    Text(AppString.tutorialOthersMessageTitle)
                        .font(Font.system(size: 16))
                        .fontWeight(.bold)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                }
                Text(AppString.tutorialOthersMessageContent)
                    .font(Font.system(size: 12))
                    .lineLimit(1)
                    .foregroundColor(AppColors.textDark)
                
                Rectangle()
                    .fill(AppColors.main300)
                    .frame(height: 1)
                    .padding(.vertical, 4)
                HStack(spacing: 0) {
                    Image("ico_walking_mini")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 23)
                    Text(AppString.tutorialOthersWalkingTitle)
                        .font(Font.system(size: 16))
                        .fontWeight(.bold)
                        .padding(.horizontal, 0)
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                    Image("ico_info")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 14)
                }
                HStack(alignment: .bottom, spacing: 0) {
                    Text(AppString.tutorialOthersWalkingContent1)
                        .font(Font.system(size: 16))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                    Text(AppString.tutorialOthersWalkingContent2)
                        .font(Font.system(size: 12))
                        .lineLimit(1)
                        .foregroundColor(AppColors.textDark)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
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
