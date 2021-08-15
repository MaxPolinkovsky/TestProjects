//
//  ChatAppStarterApp.swift
//  Shared
//
//  Created by Andreas Schultz on 28.07.20.
//

import SwiftUI
import Firebase

@main
struct ChatAppStarterApp: App {
    
    @StateObject var viewRouter = ViewRouter(pageToStartWith: UserDefaults.standard.string(forKey: "username") != nil ? .chatView : .loginView)
    
    init() {
        FirebaseApp.configure()
      }
    
    var body: some Scene {
        WindowGroup {
            MotherView()
                .environmentObject(viewRouter)
        }
    }
}
