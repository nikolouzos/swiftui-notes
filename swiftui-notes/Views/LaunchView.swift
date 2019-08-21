//
//  LaunchView.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 21/8/19.
//  Copyright © 2019 NIKOLOUZOS LTD. All rights reserved.
//

import SwiftUI
import FirebaseAuth

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
            HStack {
                Text("Welcome to the ")
                    .font(.title)
                Text("Notes App")
                    .font(.title)
                    .color(.orange)
                    .bold()
                Text("!")
                    .font(.title)
            }
            Text("We aim to help you be your most productive self!")
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
            Text("Let's get started!")
                .color(.white)
                .font(.headline)
                .padding(.bottom)
            
            HStack {
                Text("PHONE")
                    .font(.subheadline)
                    .color(.white)
                    .padding(.bottom, 0)
                    .padding(.leading, 4)
                Spacer()
            }
            
            TextField($phone, placeholder:
                Text("Enter your phone")
                    .color(.orange)
                )
                .lineLimit(1)
                .textContentType(.telephoneNumber)
                .padding(.all)
                .background(Color.white, cornerRadius: 5)
            
            Button(
                action: { self.verifyPhone() },
                label: {
                    // Change the text of the button depending on the state of the view
                    Text("Login")
                        .font(.body)
                })
                .padding(.horizontal, 28)
                .padding(.vertical, 8)
                .background(Color.white, cornerRadius: 5)
            }
            .padding(.all)
            .foregroundColor(.orange)
            .background(
                RoundedRectangle(cornerRadius: 20,
                style: .circular)
                    .foregroundColor(.orange)
                .edgesIgnoringSafeArea(.bottom)
            )
    }
    
    /// Validates the user's phone. If the validation is successful, a code will be sent to the
    /// user via SMS to authenticate them
    func verifyPhone() {
        // Validate the user's phone using regex
        if self.phone.range(
            of: #"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$"#,
            options: .regularExpression
            ) != nil {
            log.info("The user's phone is \(self.phone)")
            
            // Show the loader
            self.loading = true
            
            // Login the user using Firebase's phone auth
            PhoneAuthProvider.provider()
                .verifyPhoneNumber(self.phone, uiDelegate: nil,
                                   completion: { (verificationId, error) in
                
                if let error = error {
                    log.error("Firebase Auth: Error \(error.localizedDescription)")
                } else {
                    
                }
            })
        }
    }
}
