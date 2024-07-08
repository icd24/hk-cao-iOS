//
//  TutorialCareerSheetView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/07.
//

import SwiftUI

struct TutorialCareerSheetView: View {
    @StateObject var viewModel: TutorialCareerSheetViewModel
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer().frame(height: 10)
                        Text(AppString.tutorialCareerName)
                            .font(Font.system(size: 18))
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                        Text(AppString.tutorialCareerTitle)
                            .font(Font.system(size: 12))
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                        Text(AppString.tutorialCareerGender)
                            .font(Font.system(size: 12))
                            .padding(.horizontal, 10)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                        Text(AppString.tutorialCareerBirthday)
                            .font(Font.system(size: 12))
                            .padding(.horizontal, 10)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                        Text(AppString.tutorialCareerCertificates)
                            .font(Font.system(size: 12))
                            .padding(.horizontal, 10)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                    }
                    Spacer()
                    Image("img_career_sheet_progress")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 121)
                        .padding(.top, 10)
                }
                
                Button {
                } label: {
                    Text(AppString.careerSheetChangeButton)
                        .font(Font.system(size: 18, weight: .bold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(AppColors.textWhite)
                        .foregroundColor(AppColors.main)
                        .cornerRadius(12)
                        .padding(.vertical, 16)
                }
            }
            .padding(.horizontal, 20)
        }
        .background(AppColors.main)
        .overlay(
            Group {
                if viewModel.isMasked {
                    AppColors.maskColor.edgesIgnoringSafeArea(.bottom)
                }
            }
        )
    }
}
