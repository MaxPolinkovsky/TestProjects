//
//  ExtensionString.swift
//  Info
//
//  Created by Max Polinkovsky on 23.07.21.
//

import Foundation

extension String {
    
    func localized(withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
    
    func delSpaces() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).replacingOccurrences(of: ", ", with: ",")
    }
}
