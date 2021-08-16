//
//  SearchBar.swift
//  ToDo
//
//  Created by Max Polinkovsky on 19.07.21.
//

import SwiftUI

struct SearchBar: View {
    
    var rowHeight: CGFloat = 50
    
    @Binding var searchText: String
    @Binding var searching: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search task ..", text: $searchText) { startedEditing in
                     if startedEditing {
                         withAnimation {
                             searching = true
                         }
                     }
                 } onCommit: {
                     withAnimation {
                         searching = false
                     }
                 }
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: rowHeight*0.75)
        .cornerRadius(13)
        .padding()
    }
    
    struct SearchBar_Previews: PreviewProvider {
        static var previews: some View {
            SearchBar(searchText: .constant(""), searching: .constant(false))
                .previewLayout(.sizeThatFits)
        }
    }
}
