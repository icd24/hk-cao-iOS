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
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        return VStack(alignment: .center, spacing: 0) {
            if direction == .top {
                TextBubblePointer()
                    .fill(.mainWhite)
                    .frame(width: 20 * ds.hRatio, height: 10 * ds.hRatio)
                    .rotationEffect(Angle(degrees: 0))
            }
            HStack(alignment: .center, spacing: 0) {
                if direction == .leading {
                    TextBubblePointer()
                        .fill(.mainWhite)
                        .frame(width: 20 * ds.hRatio, height: 10 * ds.hRatio)
                        .rotationEffect(Angle(degrees: 270))
                        .offset(x: 5 * ds.hRatio)
                }
                VStack {
                    if mainText != nil {
                        Text(mainText!)
                            .font(Font.system(size: 14 * ds.hRatio))
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .foregroundColor(.main)
                            .multilineTextAlignment(.center)
                    }
                    if subText != nil {
                        Text(subText!)
                            .font(Font.system(size: 12 * ds.hRatio))
                            .lineLimit(2)
                            .foregroundColor(.textDark)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.horizontal, 10 * ds.hRatio)
                .padding(.vertical, 6 * ds.vRatio)
                .background(
                    RoundedRectangle(cornerRadius: 6 * ds.hRatio)
                        .fill(Color.white)
                )
                if direction == .trailing {
                    TextBubblePointer()
                        .fill(.mainWhite)
                        .frame(width: 20 * ds.hRatio, height: 10 * ds.hRatio)
                        .rotationEffect(Angle(degrees: 90))
                        .offset(x: -5 * ds.hRatio)
                }
            }
            
            if direction == .bottom {
                TextBubblePointer()
                    .fill(.mainWhite)
                    .frame(width: 20 * ds.hRatio, height: 10 * ds.hRatio)
                    .rotationEffect(Angle(degrees: 180))
            }
        }
        .background(.transparent)
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
