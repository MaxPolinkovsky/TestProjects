//
//  Subview.swift
//  Calmify
//
//  Created by Max Polinkovsky on 17.07.21.
//

import SwiftUI

struct Subview: View {
    let subviewModel: SubviewModel
    
        var body: some View {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Image(subviewModel.imageString)
                        .resizable()
                        .frame(height: geometry.size.height/2)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .padding(.top, 70)
                        .padding()
                    Text(subviewModel.title)
                        .font(.title)
                        .padding()
                    Text(subviewModel.caption)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                }
            }
        }
    }


struct Subview_Previews: PreviewProvider {
    static var previews: some View {
        Subview(subviewModel: subviewData[1])
    }
}
