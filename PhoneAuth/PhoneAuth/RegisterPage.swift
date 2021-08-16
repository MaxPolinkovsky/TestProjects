//
//  FirstPage.swift
//  PhoneAuth
//
//  Created by Max Polinkovsky on 14.08.21.
//

import SwiftUI
import Firebase

struct RegisterPage: View {
    @StateObject private var timer = TimerCounter()
    @State private var text = ""
    @State private var message = ""
    @State private var alert = false

    var body : some View {
            VStack {
                Image("lock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .ignoresSafeArea()
                
                Text("Verify Your Number").font(.largeTitle).fontWeight(.heavy)
                
                Text("Please Enter Your Number To Verify Your Account")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 12)
                
                NumberField(text: $text)
                    .padding()
                Link(timer: timer,
                     text: $text,
                     message: $message,
                     alert: $alert)
                    .padding()
            }
            .alert(isPresented: $alert) {
                Alert(title: Text("Error"),
                      message: Text(self.message),
                      dismissButton: .default(Text("Ok")))
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9805231449, green: 1, blue: 0.7046254574, alpha: 1)), Color(#colorLiteral(red: 0.9994423161, green: 1, blue: 0.9709166786, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                            .rotationEffect(.degrees(45)))
                            .animation(Animation.linear(duration: 1)
                            )
        }
    }

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}

