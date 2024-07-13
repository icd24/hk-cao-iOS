//
//  TermOfServiceView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 30/06/2024.
//

import SwiftUI

struct TermOfServiceView: View {
    @ObservedObject var viewModel: TermOfServiceViewModel
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer().frame(width: 20 * ds.hRatio)
                Image("img_title_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20 * ds.vRatio)
                Spacer()
                Image("ico_menu")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20 * ds.vRatio)
                Spacer().frame(width: 20 * ds.hRatio)
            }
            
            Text(AppString.termOfServiceTitle)
                .font(Font.system(size: 16 * ds.hRatio))
                .fontWeight(.bold)
                .padding(.horizontal, 20 * ds.hRatio)
                .padding(.bottom, 10 * ds.vRatio)
                .foregroundColor(AppColors.main)
            
            ScrollView {
                Spacer().frame(height: 10 * ds.vRatio)
                ForEach(AppString.termOfService.indices, id:\.self) { termOfServiceIndex in
                    VStack(alignment: .leading) {
                        ForEach(AppString.termOfService[termOfServiceIndex]) { item in
                            switch (item.type) {
                            case .SectionHeader:
                                Text(item.content ?? "")
                                    .font(Font.system(size: 16 * ds.hRatio))
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.main)
                            case .Header:
                                Text(item.content ?? "")
                                    .font(Font.system(size: 16 * ds.hRatio))
                                    .fontWeight(.bold)
                                    .padding(.vertical, 0)
                            case .Separator:
                                Rectangle()
                                    .fill(AppColors.main300)
                                    .frame(height: 1)
                                    .padding(.vertical, 8 * ds.vRatio)
                            case .Text:
                                Text(item.content ?? "")
                                    .font(Font.system(size: 16 * ds.hRatio))
                                    .padding(.top, item.isPadding ? 6 * ds.vRatio : 0)
                            case .TextIndent:
                                HStack (alignment: .top) {
                                    Text(item.indent ?? " ")
                                        .font(Font.system(size: 16 * ds.hRatio))
                                    Text(item.content ?? "")
                                        .font(Font.system(size: 16 * ds.hRatio))
                                }
                                .padding(.top, item.isPadding ? 6 * ds.vRatio : 0)
                            }
                        }
                    }
                    .padding(.all, 10 * ds.hRatio)
                    .background(
                        RoundedRectangle(cornerRadius: 8 * ds.hRatio)
                            .fill(AppColors.textWhite)
                            .shadow(color: AppColors.shadow30, radius: 3 * ds.hRatio, x: 0, y: 0)
                    )
                }
                Spacer().frame(height: 10 * ds.vRatio)
            }
            .padding(.horizontal, 20 * ds.hRatio)
            .background(AppColors.backgroundTermOfService)
        }
    }
}

#Preview {
    TermOfServiceView(viewModel: TermOfServiceViewModel())
}
