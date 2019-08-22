//
//  User.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 22/8/19.
//  Copyright © 2019 NIKOLOUZOS LTD. All rights reserved.
//

import Foundation

struct User {
    // User singleton
    static var `default` = User()
    
    var id: String?
    var noteIds = [String]()
}
