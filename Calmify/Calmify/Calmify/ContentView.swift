//
//  ContentView.swift
//  Calmify
//
//  Created by Max Polinkovsky on 17.07.21.
//

import SwiftUI

struct ContentView: View {
    
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
    }
    
    @State var selectedTab: Tab = .meditating
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                
                TabView(selection: $selectedTab) {
                    ForEach(subviewData) { entry in
                        Subview(subviewModel: entry)
                            .tag(entry.tag)
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .navigationTitle("Calmify")
                NavigatorView(selectedTab: $selectedTab)
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

struct NavigatorView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                withAnimation {
                        switch selectedTab {
                        case .meditating:
                            selectedTab = .running
                        case .running:
                            selectedTab = .walking
                        case .walking:
                            return
                        }
                    }
            }) {
                Image(systemName: "arrow.right")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(30)
            }
        }
        .padding()
    }
}
