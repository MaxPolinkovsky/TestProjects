//
//  Link.swift
//  PhoneAuth
//
//  Created by Max Polinkovsky on 14.08.21.
//

import SwiftUI
import Firebase
//import iPhoneNumberField

struct Link: View {
    @ObservedObject var timer: TimerCounter
    @State private var show = false
    @State private var ID = ""
    @Binding var text: String
    @Binding var message: String
    @Binding var alert: Bool
    
    var body: some View {
        NavigationLink(destination: ConfirmPage(ID: $ID,
                                                show: $show,
                                                timer: timer),
                                                isActive: $show) {
            Button(action: {
                PhoneAuthProvider.provider().verifyPhoneNumber(text, uiDelegate: nil) { (ID, err) in
                    if err != nil{
                        self.message = (err?.localizedDescription)!
                        self.alert.toggle()
                        return
                    }
                    self.ID = ID!
                    print("My ID: \(ID ?? "No ID, error")")
                    self.show.toggle()
                }
                timer.startTimer()
            }) { Text("Send").frame(width: UIScreen.main.bounds.width - 30,height: 50)}
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(10)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
