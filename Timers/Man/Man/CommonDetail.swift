//
//  CommonDetail.swift
//  Man
//
//  Created by Max Polinkovsky on 11.08.21.
//

import SwiftUI

struct CommonDetail: View {
    
    var persons: [Person]
    
    var body: some View {
       
        VStack(alignment: .leading) {
                Text("CommonDetail")
                    .font(.system(size: 32, weight: .bold))
                    .padding(30)
                List {
                    ForEach(persons.shuffled(), id: \.self) { person in
                        Section(header: Text("\(person.name) \(person.family)"), content: {
                            HStack {
                                Image(systemName: "phone.fill")
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                Text(person.tel)
                            }
                            HStack {
                                Image(systemName: "envelope.open.fill")
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                Text(person.email)
                            }
                            
                        })
                        
                    }
                }
            }
            
        }
    }

struct CommonDetail_Previews: PreviewProvider {
    static var previews: some View {
        CommonDetail(persons: DataManager.getPersons())
    }
}
