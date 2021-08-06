//File: ContentView.swift
//Project: SwiftUIStarter
//Created on 09.08.20
//Visit www.BLCKBIRDS.com for more tutorials.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: DetailView(currentCategory: .burger)) {
                    CategoryView(imageName: "burger", categoryName: "BURGER")
                }
                NavigationLink(
                    destination: DetailView(currentCategory: .pizza)) {
                    CategoryView(imageName: "pizza", categoryName: "PIZZA")
                }
                NavigationLink(
                    destination: DetailView(currentCategory: .pasta)) {
                    CategoryView(imageName: "pasta", categoryName: "PASTA")
                }
                NavigationLink(
                    destination: DetailView(currentCategory: .desserts)) {
                    CategoryView(imageName: "desserts", categoryName: "DESSERTS")
                }
            }
            .navigationTitle(Text("Food Delivery"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
