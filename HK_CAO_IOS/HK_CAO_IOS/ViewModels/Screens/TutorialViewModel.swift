//
//  TutorialViewModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/06.
//

import SwiftUI

class TutorialViewModel: ObservableObject {
    @Published var step: TutorialStep = .StepCareerSheet
    @Published var tabViewModel = HomeTabViewModel()
    @Published var tutorialCareerViewModel: TutorialCareerSheetViewModel = TutorialCareerSheetViewModel()
    @Published var tutorialAuctionViewModel: TutorialAuctionViewModel = TutorialAuctionViewModel()
    
    
    func onNextStep() {
        switch step {
        case .StepCareerSheet:
            step = .Auction
            tutorialCareerViewModel.isMasked = true
            tutorialAuctionViewModel.isMasked = false
        case .Auction:
            step = .Tutorial
            tutorialCareerViewModel.isMasked = true
            tutorialAuctionViewModel.isMasked = true
        case .Tutorial:
            // TODO: Will record to preference to not show again.
            AppState.shared.currentScreen = .home
        }
    }
}

enum TutorialStep: Int {
    case StepCareerSheet = 1
    case Auction = 2
    case Tutorial = 3
}
