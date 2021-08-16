//
//  ContentView.swift
//  Man
//
//  Created by Max Polinkovsky on 11.08.21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            CommonList(persons: DataManager.getPersons())
                .tabItem {
                    Image(systemName: "person.3.fill").resizable()
                    Text("CommonList")
                }
            CommonDetail(persons: DataManager.getPersons())
                .tabItem {
                    Image(systemName: "person.fill.checkmark").resizable()
                    Text("CommonListDetails")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
