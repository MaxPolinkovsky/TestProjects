//
//  DetailView.swift
//  SwiftUIStarter
//
//  Created by Max Polinkovsky on 08.06.21.
//

import SwiftUI

struct DetailView: View {
    
    let currentCategory: Categories
    @State var showOrderSheet = false
    
    var body: some View {
        List(filterData(foodDataSet: foodData, by: currentCategory)) { food in
                DetailRow(food: food, showOrderSheet: $showOrderSheet)
            }
        
        .navigationTitle(Text(categoryString(for: currentCategory)))
        .sheet(isPresented: $showOrderSheet, content: {
            OrderForm()
            })
        .listStyle(SidebarListStyle())
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(currentCategory: .burger)
        }
    }
}
