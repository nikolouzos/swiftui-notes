//
//  RouterView.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 24/8/19.
//  Copyright © 2019 NIKOLOUZOS LTD. All rights reserved.
//

import SwiftUI

struct RouterView: View {
    
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        VStack {
            containerView()
        }
    }
    
    // Returns the correct view for the router using a switch
    func containerView() -> AnyView {
        switch router.currentPage {
        case "notes":
            return AnyView(NotesView())
        default:
            return AnyView(LaunchView())
        }
    }
}

struct RouterViewPreviews: PreviewProvider {
    static var previews: some View {
        RouterView().environmentObject(AppRouter())
    }
}
