//
//  ExtensionString.swift
//  Timers
//
//  Created by Max Polinkovsky on 04.07.21.
//

import Foundation

extension String {

    func localized(withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
}
