//
//  CancelButton.swift
//  PhoneAuth
//
//  Created by Max Polinkovsky on 14.08.21.
//

import SwiftUI

struct CancelButton: View {
    @Binding var show: Bool
    var body: some View {
        Button(action: {
            self.show.toggle()
        }) {
            Image(systemName: "xmark.circle")
                .foregroundColor(.gray)
                .font(.system(size: 30))
        }
    }
}

struct ErrorAlert_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(show: .constant(false))
    }
}
