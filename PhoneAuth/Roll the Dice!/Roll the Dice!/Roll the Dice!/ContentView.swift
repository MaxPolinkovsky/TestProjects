//
//  ContentView.swift
//  Roll the Dice!
//
//  Created by Max Polinkovsky on 11.07.21.
//

import SwiftUI

struct ContentView: View {
    
    @State var rolledNumber = 1
    @State var rolledIt = false
    
    var body: some View {
        VStack {
            Image(rolledIt ? "\(rolledNumber)" : "unknown")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
                .padding(.top, 250)
            Spacer()
            Button(action: {
                let randomNumber = Int.random(in: 1 ..< 7)
                rolledNumber = randomNumber
                rolledIt = true
            }, label: {
                RollButtonContent()
                    .padding(.bottom, 40)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RollButtonContent: View {
    var body: some View {
        Text("Roll the dice")
            .frame(width: 240, height: 75)
            .foregroundColor(.white)
            .font(.headline)
            .background(Color.orange)
            .cornerRadius(20)
    }
}
