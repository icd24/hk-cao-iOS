//
//  DimensionSupport.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 11/07/2024.
//

import SwiftUI

class DimensionSupport: ObservableObject {
    static let shared = DimensionSupport()
    static let designWidth: CGFloat = 390
    static let designHeight: CGFloat = 814
        
    @Published var hRatio: CGFloat = 1.0
    @Published var vRatio: CGFloat = 1.0
    @Published var edgeTop: CGFloat = 20
    @Published var edgeBottom: CGFloat = 44
    @Published var edgeMagnitude: CGFloat = 20
    
    func updateRatio(geometry: GeometryProxy) {
        let actualWidth = geometry.size.width
        let actualHeight = geometry.size.height
        hRatio = actualWidth / DimensionSupport.designWidth
        vRatio = actualHeight / DimensionSupport.designHeight
        edgeTop = geometry.safeAreaInsets.top
        edgeBottom = geometry.safeAreaInsets.bottom
        edgeMagnitude = geometry.safeAreaInsets.magnitude
        
        PrintLog.log(message: "top edge: \(edgeTop)")
        PrintLog.log(message: "bottom edge: \(edgeBottom)")
        PrintLog.log(message: "magnitude edge: \(edgeMagnitude)")
        PrintLog.log(message: "vRatio: \(vRatio)")
        PrintLog.log(message: "size: \(geometry.size)")
    }
}
