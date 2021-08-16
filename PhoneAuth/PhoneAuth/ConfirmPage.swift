//
//  ConfirmPage.swift
//  PhoneAuth
//
//  Created by Max Polinkovsky on 14.08.21.
//

import SwiftUI
import Firebase

struct ConfirmPage: View {
    @Binding var ID: String
    @State var code = ""
    @Binding var show : Bool
    @State var message = ""
    @State var alert = false
    @ObservedObject var timer: TimerCounter
    
    var body : some View{
        ZStack(alignment: .topLeading) {
            GeometryReader{_ in
                VStack(spacing: 20){
                    Image("pic")
                    
                    Text("Verification Code")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("Please Enter The Verification Code")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 12)
                    
                    InsertCodeTextField(code: $code)

                    Text("\(timer.counter)")
                        .font(.system(size: 26, weight: .medium, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                
                    VerifyButton(code: $code,
                                 ID: $ID,
                                 message: $message,
                                 alert: $alert)
                }
            }
            CancelButton(show: $show)
        }
        .padding()
        .alert(isPresented: $alert) {
            Alert(title: Text("Error"),
                  message: Text(self.message),
                  dismissButton: .default(Text("Ok")))
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9805231449, green: 1, blue: 0.7046254574, alpha: 1)), Color(#colorLiteral(red: 0.9994423161, green: 1, blue: 0.9709166786, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                        .rotationEffect(.degrees(45))
                        .animation(.easeInOut(duration: 2))
    )}
    
}

struct ConfirmPage_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPage(ID: .constant("ID"), show: .constant(true), timer: TimerCounter())
    }
}

