//
//  Detail.swift
//  Man
//
//  Created by Max Polinkovsky on 11.08.21.
//

import SwiftUI

struct PersonsDetail: View {
    
    var person: Person
    
    var body: some View {
        List {
            HStack(alignment: .center){
                Spacer()
            Image(systemName: "person.fill")
                .font(.system(size: 150))
            }
                .padding(.bottom, 30)
            Spacer()
            HStack {
            Image(systemName: "phone.fill")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text(person.tel)
            }
                .padding(.bottom, 30)
            HStack {
            Image(systemName: "envelope.open.fill")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text(person.email)
            }
        }
        .navigationTitle("\(person.name) \(person.family)")
    }
}


struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        PersonsDetail(person: DataManager.getPerson(2))
    }
}
