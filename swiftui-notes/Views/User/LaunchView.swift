//
//  LaunchView.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 21/8/19.
//  Copyright © 2019 NIKOLOUZOS LTD. All rights reserved.
//

import SwiftUI

struct LaunchView : View {
    var body: some View {
        Group {
            VStack {
                Text("Welcome to the Notes App!")
                    .font(.title)
                Text("We aim to help you be your most productive self.")
                    .font(.body)
            }
            Spacer()
            VStack {
                Text("Ready to login?")
            }
        }
    }
}

#if DEBUG
struct LaunchView_Previews : PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
#endif
