//
//  InfoStepSeparator.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import SwiftUI

struct InfoStepSeparator: View {
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        VStack {
            VStack {
                Rectangle()
                    .fill(Color.infoStepLine)
                    .frame(width: 47 * ds.hRatio, height: 4 * ds.hRatio, alignment: .center)
            }
            .frame(height: 43 * ds.hRatio)
            // simulate text for normal column
            Text("")
                .font(.system(size: 12 * ds.hRatio))
                .foregroundColor(.main)
        }
        
        
    }
}

#Preview {
    InfoStepSeparator()
}
