//
//  LaunchView.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 21/8/19.
//  Copyright © 2019 NIKOLOUZOS LTD. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    
    @State var phone = ""
    @State var code = ""
    
    var body: some View {
        Group {
            TitleView()
            Spacer()
            LoginView(phone: $phone, code: $code)
        }
    }
}

#if DEBUG
struct LaunchViewPreviews: PreviewProvider {
    static var previews: some View {
        LaunchView(phone: "+30 6931223366", code: "111111")
    }
}
#endif

private struct TitleView: View {
    var body: some View {
        return VStack {
            Text("Welcome to the Notes App!")
                .font(.title)
                Text("We aim to help you be your most productive self.")
                    .font(.subheadline)
            }
            .padding()
    }
}

// The bottom view that manages the login
private struct LoginView: View {
    
    @Binding var phone: String
    @Binding var code: String
    
    @State var loading: Bool = false
    
    var body: some View {
        return VStack {
            if loading {
                // TODO: Add the loading view
            } else {
                VStack {
                    Text("Ready to login?")
                    
                    TextField($phone)
                        .cornerRadius(20)
                        .padding()
                    
                    Button(
                        action: {
                            // Login the user using Firebase Auth phone auth
                    },
                        label: {
                            Text("Login")
                                .font(.body)
                    })
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 20,
                                         style: .circular)
                            .foregroundColor(.secondary)
                    )
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
