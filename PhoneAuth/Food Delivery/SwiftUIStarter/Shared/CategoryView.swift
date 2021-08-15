//
//  CategoryView.swift
//  SwiftUIStarter
//
//  Created by Max Polinkovsky on 08.06.21.
//

import SwiftUI

struct CategoryView: View {
    
    let imageName: String
    let categoryName: String
    
    var body: some View {
        HStack {
            Spacer()
            ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 150)
                .cornerRadius(12)
                .clipped()
            Text(categoryName)
                .font(.system(.largeTitle).weight(.semibold))
                .foregroundColor(.white)
                .padding(30)
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)
            }
            Spacer()
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}

