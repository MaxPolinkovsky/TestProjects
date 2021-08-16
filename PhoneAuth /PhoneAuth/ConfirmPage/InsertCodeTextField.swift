//
//  InsertCodeTextField.swift
//  PhoneAuth
//
//  Created by Max Polinkovsky on 14.08.21.
//

import SwiftUI

struct InsertCodeTextField: View {
    @Binding var code: String
    
    var body: some View {
        TextField("Code", text: self.$code)
            .keyboardType(.numberPad)
            .padding()
            .background(Color("Color"))
            .overlay(RoundedRectangle(cornerRadius: 10,
                                      style: .continuous)
                        .stroke(Color.gray,
                                lineWidth: 4))
            .shadow(color: .gray.opacity(0.3),
                    radius: 10)
            .padding(.top, 15)
    }
}

struct InsertCodeTextField_Previews: PreviewProvider {
    static var previews: some View {
        InsertCodeTextField(code: .constant("1123345"))
    }
}
