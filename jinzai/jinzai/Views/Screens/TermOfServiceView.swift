//
//  TermOfServiceView.swift
//  jinzai
//
//  Created by HieuNV on 30/06/2024.
//

import SwiftUI

struct TermOfServiceView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: TermOfServiceViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer().frame(width: 20)
                Image("img_title_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                Spacer()
                Image("ico_menu")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                Spacer().frame(width: 20)
            }
            
            Text(AppString.termOfServiceTitle)
                .font(Font.system(size: 16))
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .foregroundColor(AppColors.main)
            
            ScrollView {
                Spacer().frame(height: 10)
                ForEach(AppString.termOfService.indices, id:\.self) { termOfServiceIndex in
                    VStack(alignment: .leading) {
                        ForEach(AppString.termOfService[termOfServiceIndex]) { item in
                            switch (item.type) {
                            case .SectionHeader:
                                Text(item.content ?? "")
                                    .font(Font.system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.main)
                            case .Header:
                                Text(item.content ?? "")
                                    .font(Font.system(size: 16))
                                    .fontWeight(.bold)
                                    .padding(.vertical, 0)
                            case .Separator:
                                Rectangle()
                                    .fill(AppColors.main300)
                                    .frame(height: 1)
                                    .padding(.vertical, 8)
                            case .Text:
                                Text(item.content ?? "")
                                    .font(Font.system(size: 16))
                                    .padding(.top, item.isPadding ? 6 : 0)
                            case .TextIndent:
                                HStack (alignment: .top) {
                                    Text(item.indent ?? " ")
                                        .font(Font.system(size: 16))
                                    Text(item.content ?? "")
                                        .font(Font.system(size: 16))
                                }
                                .padding(.top, item.isPadding ? 6 : 0)
                            }
                        }
                    }
                    .padding(.all, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(AppColors.textWhite)
                            .shadow(color: AppColors.shadow30, radius: 3, x: 0, y: 0)
                    )
                }
                Spacer().frame(height: 10)
            }
            .padding(.horizontal, 20)
            .background(AppColors.termOfServiceBackground)
        }
    }
}
