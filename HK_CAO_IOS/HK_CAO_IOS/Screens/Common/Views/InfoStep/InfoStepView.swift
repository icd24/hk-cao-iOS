//
//  InfoStepView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import SwiftUI

struct InfoStepView: View {
    let step: InfoStep
    
    var body: some View {
        HStack {
            InfoStepItemView(isCurrent: step == .profile, stepNumber: "1", stepName: AppString.registerInfoStepProfile)
            InfoStepSeparator()
            InfoStepItemView(isCurrent: step == .workingHistory, stepNumber: "2", stepName: AppString.registerInfoStepWorkingHistory)
            InfoStepSeparator()
            InfoStepItemView(isCurrent: step == .desire, stepNumber: "3", stepName: AppString.registerInfoStepDesire)
        }
    }
}

enum InfoStep {
    case profile
    case workingHistory
    case desire
}

#Preview {
    InfoStepView(step: .profile)
}
