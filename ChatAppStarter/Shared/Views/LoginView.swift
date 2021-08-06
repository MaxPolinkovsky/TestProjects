//
//  LoginView.swift
//  ChatAppStarter
//
//  Created by Andreas Schultz on 28.07.20.
//

import SwiftUI

struct LoginView: View {
    
    @State var usernameInput = ""
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .padding(.top, 100)
                .padding(.bottom, 170)
            Text("Please choose a username")
            TextField("Enter username...", text: $usernameInput)
                .padding()
                .frame(height: 50)
                .background(Color("LightGrayColor"))
                .cornerRadius(10)
                .padding()
            Spacer()
            Button(action: {self.signIn()}) {
                Text("LOGIN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
            Spacer()
        }
    }
    
    func signIn() {
        
        guard !usernameInput.isEmpty else {
            return
        }
        
        let defaults = UserDefaults.standard
        defaults.set(usernameInput, forKey: "username")
        
        viewRouter.currentPage = .chatView
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
