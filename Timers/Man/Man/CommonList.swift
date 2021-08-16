//
//  CommonList.swift
//  Man
//
//  Created by Max Polinkovsky on 11.08.21.
//

import SwiftUI

struct CommonList: View {
    
    var persons: [Person]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(persons.shuffled(), id: \.self) { person in
                        NavigationLink(
                            destination: PersonsDetail(person: person),
                            label: {
                                HStack(spacing: 20) {
                                    Text(person.name)
                                    Text(person.family)
                                }
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            })
                    }
                    
                }
            }
            .navigationTitle("Persons")
        }
    }
}

struct CommonList_Previews: PreviewProvider {
    static var previews: some View {
        CommonList(persons: DataManager.getPersons())
    }
}
