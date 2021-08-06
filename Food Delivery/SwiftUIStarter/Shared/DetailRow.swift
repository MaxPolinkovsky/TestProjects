//
//  DetailRow.swift
//  SwiftUIStarter
//
//  Created by Max Polinkovsky on 08.06.21.
//

import SwiftUI

struct DetailRow: View {
    
    let food: Food
    @Binding var showOrderSheet: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food.title)
                    .font(.headline)
                    .padding(.top, 10)
                Text("\(food.price, specifier: "%2.2f")$")
                    .font(.caption)
                    
            }
            Spacer()
            Button(action: {
                showOrderSheet = true
            }) {
                Text("ORDER")
                    .foregroundColor(.white)
            }
            .frame(width: 80, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.orange)
            .cornerRadius(12)
            .buttonStyle(BorderlessButtonStyle()) //
        }
        .padding()
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(food: foodData[0], showOrderSheet: .constant(false))
                    .previewLayout(.sizeThatFits)
    }
}
