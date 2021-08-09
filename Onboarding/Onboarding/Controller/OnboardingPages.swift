//
//  OnboardingPages.swift
//  Onboarding
//
//  Created by Max Polinkovsky on 12.07.21.
//

import Foundation

struct OnboardingPages {
    
    static let shared = OnboardingPages()
    
    let pages = [
        OnboardingPageModel(image: page1Image, label: page1Label, text: page1Text),
        OnboardingPageModel(image: page2Image, label: page2Label, text: page2Text),
        OnboardingPageModel(image: page3Image, label: page3Label, text: page3Text),
    ]
}
