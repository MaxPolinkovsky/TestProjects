///
//  OnboardingPages.swift
//  learnde
//
//  Created by Max Polinkovsky on 05.04.21.
//  Copyright © 2021 Max Polinkovsky. All rights reserved.
//

import Foundation

struct OnboardingPages {
    
    static let shared = OnboardingPages()
    
    let pages = [
        OnboardingPageModel(pageText: "Whats your current\nenglish level?"),
        OnboardingPageModel(pageText: "How much time do you\nwant to learning english?"),
        OnboardingPageModel(pageText: "Preparing your plan"),
        OnboardingPageModel(pageText: "Personal plan"),
        OnboardingPageModel(pageText: "Get a reminder to\nmeet your goal")
    ]
}
