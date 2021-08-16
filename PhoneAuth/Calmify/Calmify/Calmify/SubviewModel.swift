//
//  SubviewModel.swift
//  Calmify
//
//  Created by Max Polinkovsky on 17.07.21.
//

import Foundation

struct SubviewModel: Identifiable {
    
    let imageString: String
    let title: String
    let caption: String
    let tag: Tab
    let id = UUID()
}

enum Tab: Hashable {
    case meditating
    case running
    case walking
}
