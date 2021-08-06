//
//  ViewRouter.swift
//  ChatAppStarter
//
//  Created by Andreas Schultz on 28.07.20.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .loginView
    
    init(pageToStartWith: Page) {
        currentPage = pageToStartWith
    }
}
