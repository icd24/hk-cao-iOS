//
//  InfoStepItemView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import SwiftUI

struct InfoStepItemView: View {
    let isCurrent: Bool
    let stepNumber: String
    let stepName: String
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        VStack {
            Text(stepNumber)
                .font(.system(size: 18 * ds.hRatio, weight: .bold))
                .foregroundColor(isCurrent ? .mainWhite : .main)
                .frame(width: 43 * ds.hRatio, height: 43 * ds.hRatio)
                .background(
                    Circle()
                        .foregroundColor(isCurrent ? .main : .mainWhite)
                        .frame(width: 43 * ds.hRatio, height: 43 * ds.hRatio)
                )
                .overlay(
                    Circle()
                        .stroke(.main, lineWidth: 1)
                        .frame(width: 43 * ds.hRatio, height: 43 * ds.hRatio)
                )
                .clipShape(Circle())
            Text(stepName)
                .font(.system(size: 12 * ds.hRatio))
                .foregroundColor(.main)
        }
    }
}

#Preview {
    InfoStepItemView(isCurrent: true, stepNumber: "1", stepName: AppString.registerInfoStepProfile)
}