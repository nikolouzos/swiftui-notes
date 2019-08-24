//
//  AppRouter.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 24/8/19.
//  Copyright © 2019 NIKOLOUZOS LTD. All rights reserved.
//

import SwiftUI
import Combine

// Manages the routes of our application
class AppRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<AppRouter, Never>()
    
    // Set the default View here
    var currentPage: String = "launch" {
        didSet {
            withAnimation {
                objectWillChange.send(self)
            }
        }
    }
}
