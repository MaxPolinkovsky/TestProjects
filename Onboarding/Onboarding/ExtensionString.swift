//
//  ExtensionString.swift
//  Onboarding
//
//  Created by Max Polinkovsky on 12.07.21.
//

import Foundation

extension String {

    func localized(withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
}
