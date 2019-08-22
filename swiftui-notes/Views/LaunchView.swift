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
        VStack {
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
        return VStack(spacing: -4) {
            HStack {
                Text("Welcome to the")
                    .font(.title)
                Text("Notes App")
                    .font(.title)
                    .foregroundColor(.orange)
                    .bold()
                Text("!")
                    .font(.title)
            }
            Text("We aim to help you be your most productive self!")
                .font(.body)
            }
    }
}

// The bottom view that manages the login
private struct LoginView: View {
    
    @Binding var phone: String
    @Binding var code: String
    
    @State var loading: Bool = false
    
    var body: some View {
        return VStack {
            Text(verbatim: "Let's get started!")
                .foregroundColor(.white)
                .font(.headline)
                .padding(.bottom)

            HStack {
                Text(verbatim: "PHONE")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.bottom, 0)
                    .padding(.leading, 4)
                Spacer()
            }

            TextField("Enter your phone", text: $phone)
                .lineLimit(1)
                .textContentType(.telephoneNumber)
                .padding(.all)
                .background(Color.white)
                .cornerRadius(8)

            Button(
                action: { self.verifyPhone() },
                label: {
                    // Change the text of the button depending on the state of the view
                    Text("Login")
                        .font(.body)
                })
                .padding(.horizontal, 32)
                .padding(.vertical, 8)
                .background(Color.white)
                .cornerRadius(3)
            }
        .padding(.all)
            .foregroundColor(.orange)
            .background(
                RoundedRectangle(cornerRadius: 20)
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
