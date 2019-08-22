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
    
    // To see what the loading state does, check the LoginView
    @State var loading = false
    
    var body: some View {
        VStack {
            TitleView()
            Spacer()
            if loading {
                // Show a loader
            } else {
                // Show the LoginView
                LoginView(loading: $loading)
            }
        }
    }
}

#if DEBUG
struct LaunchViewPreviews: PreviewProvider {
    static var previews: some View {
        LaunchView(loading: false)
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
    
    @State var verificationId: String?
    @State var phone: String = ""
    @State var code: String = ""
    
    // These are the states this View can be in
    
    // The loading state means we are waiting for something to happen
    @Binding var loading: Bool
    // The authenticating state means we are waiting for an authentication code to be entered
    @State var authenticating: Bool = false
    
    var body: some View {
        return VStack {
            Text("Let's get started!")
                .foregroundColor(.white)
                .font(.headline)
            
            if !authenticating {
                Text("We will need your phone number to sign you in")
                    .foregroundColor(.white)
                    .font(.subheadline)
            }

            HStack {
                Text(authenticating ? "VERIFICATION CODE" : "PHONE NUMBER")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.bottom, 0)
                    .padding(.leading, 4)
                Spacer()
            }

            TextField(
                authenticating ? "Enter the code you received" : "Enter your phone number",
                text: $phone)
                .lineLimit(1)
                .textContentType(.telephoneNumber)
                .padding(.all)
                .background(Color.white)
                .cornerRadius(5)

            Button(
                action: { self.authenticating ? self.signIn() : self.verifyPhone() },
                label: {
                    // Change the text of the button depending on the state of the view
                    Text(authenticating ? "Login" : "Send me a verification code")
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
        if phone.range(of: #"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$"#, options: .regularExpression) != nil {
            log.info("The user's phone is \(self.phone)")
            
            // Show the loader
            loading = true
            
            // Login the user using Firebase's phone auth
            PhoneAuthProvider.provider()
                .verifyPhoneNumber(self.phone, uiDelegate: nil,
                                   completion: { (verificationId, error) in
                self.loading = false
                
                if let error = error {
                    log.error("Firebase Auth: Error \(error.localizedDescription)")
                    self.authenticating = false
                    self.verificationId = nil
                } else {
                    // Store the verificationId for future use and change the state to authenticating
                    self.authenticating = true
                    self.verificationId = verificationId
                }
            })
        }
    }
    
    /// Signs the user in using the code entered
    func signIn() {
        // Make sure the code is in the correct format
        if let verificationId = verificationId,
            code.range(of: #"^(\d\s*){6}$"#, options: .regularExpression) != nil {
            
            // Update the state
            loading = true
            
            // Create the credentials object
            let credential = PhoneAuthProvider.provider().credential(
                withVerificationID: verificationId, verificationCode: code.replacingOccurrences(of: " ", with: ""))
            
            // Try to signin the user with the credential
            Auth.auth().signIn( with: credential, completion: { (result, error) in
                if let error = error {
                    // Log the error
                    log.error("Firebase Auth: Error \(error)")
                    
                    // Update the state
                    self.loading = false
                    
                } else if let result = result {
                    // Set the uid
                    User.default.id = result.user.uid
                    
                    // Update the state
                    self.loading = false
                    
                    // Navigate to the NotesView
                }
            })
        }
    }
}
