//
//  NoteContent.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 24/8/19.
//  Copyright © 2019 NIKOLOUZOS LTD. All rights reserved.
//

import Foundation

/// This struct defines the types of content a Note can contain
class NoteContent {
    var rawContent: String
    var type: Type
    
    /// Lists the all the content types
    enum `Type`: String {
        case text
        case checklist
        case unknown
    }
    
    /// Do not use this for initializing NoteContent.
    /// Use the TextNoteContent or ChecklistNoteContent initializer
    init(fromDict dict: [String: Any]) {
        // Initialize the rawContent and type
        rawContent = dict["value"] as? String ?? ""
        type = Type(rawValue: dict["type"] as? String ?? "") ?? Type.unknown
    }
}

/// The text NoteContent type
class TextNoteContent: NoteContent {
    var text: String?
    
    override init(fromDict dict: [String: Any]) {
        super.init(fromDict: dict)
        
        // Initialize the text
        text = rawContent
    }
}

/// The checklist NoteContent type
class ChecklistNoteContent: NoteContent {
    var checkList = [String]()
    var checked = [Bool]()
    
    override init(fromDict dict: [String: Any]) {
        super.init(fromDict: dict)
        
        if let valuesArray = dict["values"] as? [String],
            let checkedArray = dict["checked"] as? [Bool] {
            
            for (index, value) in valuesArray.enumerated() {
                
                // Add the checked status and the content of item
                checkList.append(value)
                checked.append(checkedArray[index])
            }
        }
    }
}
