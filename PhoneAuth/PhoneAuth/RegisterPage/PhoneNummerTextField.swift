//
//  PhoneNummerTextField.swift
//  PhoneAuth
//
//  Created by Max Polinkovsky on 14.08.21.
//

import SwiftUI
import iPhoneNumberField

struct PhoneNummerTextField: View {
    @State private var isEditing = false
    @State private var text = ""
    var body: some View {
        iPhoneNumberField("Add phone...", text: $text, isEditing: $isEditing)
            .flagHidden(false)
            .prefixHidden(false)
            .flagSelectable(true)
            .font(.systemFont(ofSize: 20, weight: .regular))
            .maximumDigits(20)
            .foregroundColor(Color.pink)
            .clearButtonMode(.whileEditing)
            .onClear { _ in isEditing.toggle() }
            .accentColor(Color.orange)
            .padding()
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 10,
                                      style: .continuous)
                        .stroke(Color.gray, lineWidth: 4))
            .shadow(color: isEditing ? .gray.opacity(0.3) : .white, radius: 10)
            .padding()
    }
}

struct PhoneNummerTextField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNummerTextField()
    }
}
