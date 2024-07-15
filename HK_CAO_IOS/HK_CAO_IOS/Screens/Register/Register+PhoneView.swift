//
//  Register+GenderView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import SwiftUI

struct Register_PhoneView: View {
    @ObservedObject var viewModel: RegisterViewModel
    let ds: DimensionSupport = DimensionSupport.shared
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Register_PhoneView(viewModel: RegisterViewModel())
}
