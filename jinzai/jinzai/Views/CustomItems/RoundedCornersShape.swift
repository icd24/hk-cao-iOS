//
//  RoundedCornersShape.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
