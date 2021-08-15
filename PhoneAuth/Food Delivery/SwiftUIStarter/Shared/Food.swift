//
//  ModelFood.swift
//  SwiftUIStarter
//
//  Created by Max Polinkovsky on 08.06.21.
//

import SwiftUI

struct Food: Identifiable {
    let title: String
    let price: Double
    let category: Categories
    let id = UUID()
}
