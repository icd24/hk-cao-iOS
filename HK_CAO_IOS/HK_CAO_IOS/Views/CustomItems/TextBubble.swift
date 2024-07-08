//
//  TextBubble.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/09.
//

import SwiftUI

struct TextBubble: View {
    var mainText: String? = nil
    var subText: String? = nil
    var direction: Alignment = .top
    
    var body: some View {
        return VStack(alignment: .center, spacing: 0) {
            if direction == .top {
                TextBubblePointer()
                    .fill(AppColors.mainWhite)
                    .frame(width: 20, height: 10)
                    .rotationEffect(Angle(degrees: 0))
            }
            HStack(alignment: .center, spacing: 0) {
                if direction == .leading {
                    TextBubblePointer()
                        .fill(AppColors.mainWhite)
                        .frame(width: 20, height: 10)
                        .rotationEffect(Angle(degrees: 270))
                        .offset(x: 5)
                }
                VStack {
                    if mainText != nil {
                        Text(mainText!)
                            .font(Font.system(size: 14))
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .foregroundColor(AppColors.main)
                            .multilineTextAlignment(.center)
                    }
                    if subText != nil {
                        Text(subText!)
                            .font(Font.system(size: 12))
                            .lineLimit(2)
                            .foregroundColor(AppColors.textDark)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white)
                )
                if direction == .trailing {
                    TextBubblePointer()
                        .fill(AppColors.mainWhite)
                        .frame(width: 20, height: 10)
                        .rotationEffect(Angle(degrees: 90))
                        .offset(x: -5)
                }
            }
            
            if direction == .bottom {
                TextBubblePointer()
                    .fill(AppColors.mainWhite)
                    .frame(width: 20, height: 10)
                    .rotationEffect(Angle(degrees: 180))
            }
        }
        .background(AppColors.transparent)
    }
}

struct TextBubblePointer: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
