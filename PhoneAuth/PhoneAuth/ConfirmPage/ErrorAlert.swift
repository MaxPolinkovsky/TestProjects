//
//  ErrorAlert.swift
//  PhoneAuth
//
//  Created by Max Polinkovsky on 14.08.21.
//

import SwiftUI

struct ErrorAlert: View {
    @Binding var show: Bool
    var body: some View {
        Button(action: {
            self.show.toggle()
        }) {
            Image(systemName: "chevron.left").font(.title)
        }.foregroundColor(.orange)
    }
}

//struct ErrorAlert_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorAlert()
//    }
//}
