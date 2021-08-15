//
//  MotherView.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Max Polinkovsky on 16.07.21.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        switch viewRouter.currentPage {
            case .page1:
                ContentViewA().environmentObject(viewRouter)
                    .transition(.opacity)
            case .page2:
                ContentViewB().environmentObject(viewRouter)
                    .transition(.scale)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
            .previewDevice("iPhone 11 Pro Max")
    }
}

