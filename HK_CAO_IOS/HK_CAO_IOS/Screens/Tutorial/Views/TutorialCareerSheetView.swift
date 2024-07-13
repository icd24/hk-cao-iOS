//
//  TutorialCareerSheetView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/07.
//

import SwiftUI

struct TutorialCareerSheetView: View {
    @StateObject var viewModel: TutorialCareerSheetViewModel
    let ds: DimensionSupport = DimensionSupport.shared
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer().frame(height: 10 * ds.vRatio)
                        Text(AppString.tutorialCareerName)
                            .font(Font.system(size: 18 * ds.hRatio))
                            .fontWeight(.bold)
                            .padding(.horizontal, 10 * ds.hRatio)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                        Text(AppString.tutorialCareerTitle)
                            .font(Font.system(size: 12 * ds.hRatio))
                            .padding(.horizontal, 10 * ds.hRatio)
                            .padding(.bottom, 10 * ds.vRatio)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                        Text(AppString.tutorialCareerGender)
                            .font(Font.system(size: 12 * ds.hRatio))
                            .padding(.horizontal, 10 * ds.hRatio)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                        Text(AppString.tutorialCareerBirthday)
                            .font(Font.system(size: 12 * ds.hRatio))
                            .padding(.horizontal, 10 * ds.hRatio)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                        Text(AppString.tutorialCareerCertificates)
                            .font(Font.system(size: 12 * ds.hRatio))
                            .padding(.horizontal, 10 * ds.hRatio)
                            .lineLimit(1)
                            .foregroundColor(AppColors.textWhite)
                    }
                    Spacer()
                    Image("img_career_sheet_progress")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 121 * ds.hRatio)
                        .padding(.top, 10 * ds.vRatio)
                }
                
                Button {
                } label: {
                    Text(AppString.careerSheetChangeButton)
                        .font(Font.system(size: 18 * ds.hRatio, weight: .bold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(AppColors.textWhite)
                        .foregroundColor(AppColors.main)
                        .cornerRadius(12 * ds.hRatio)
                        .padding(.vertical, 16 * ds.vRatio)
                }
            }
            .padding(.horizontal, 20 * ds.hRatio)
        }
        .background(
            Rectangle()
                .fill(AppColors.main)
                .shadow(color: AppColors.shadow30, radius: 10 * ds.hRatio, x: 0, y: 0)
        )
        .overlay(
            Group {
                if viewModel.isMasked {
                    AppColors.maskColor.edgesIgnoringSafeArea(.bottom)
                }
            }
        )
    }
}

#Preview {
    TutorialCareerSheetView(viewModel: TutorialCareerSheetViewModel())
}
