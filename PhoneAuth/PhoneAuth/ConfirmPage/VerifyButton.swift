//
//  VerifyButton.swift
//  PhoneAuth
//
//  Created by Max Polinkovsky on 14.08.21.
//

import SwiftUI
import Firebase

struct VerifyButton: View {
    @Binding var code: String
    @Binding var ID : String
    @Binding var message: String
    @Binding var alert: Bool
    
    var body: some View {
        Button(action: {
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
            
            Auth.auth().signIn(with: credential) { (result, error) in
                
                if error != nil {
                    self.message = (error?.localizedDescription)!
                    self.alert.toggle()
                    return
                }
                UserDefaults.standard.set(true, forKey: "status")
                
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            }
        }) {
            
            Text("Verify").frame(width: UIScreen.main.bounds.width - 30,height: 50)
            
        }.foregroundColor(.white)
        .background(Color.orange)
        .cornerRadius(10)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//struct VerifyButton_Previews: PreviewProvider {
//    static var previews: some View {
//        VerifyButton()
//    }
//}
