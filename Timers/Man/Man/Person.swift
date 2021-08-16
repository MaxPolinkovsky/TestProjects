//
//  Person.swift
//  Man
//
//  Created by Max Polinkovsky on 11.08.21.
//

import SwiftUI

struct Person: Identifiable, Hashable {
    var id = UUID()
    var name = ""
    var family = ""
    var tel = ""
    var email = ""
}
