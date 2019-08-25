//
//  Note.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 07/07/2019.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct Note: Identifiable {
	var id: String
    var content: [NoteContent]
	var archived: Bool
    
    var ownerId: String
    var editors: [String]
    var watchers: [String]

	/// Maps a dictionary containing a note to a Note object
	static func map(fromDict dict: [String: Any]) -> Note? {

		// Make sure that the note has the correct data
		guard
            let id = dict["id"] as? String,
            let contentDicts = dict["content"] as? [[String: Any]],
            let archived = dict["archived"] as? Bool,
            let ownerId = dict["owner"] as? String,
            let editors = dict["editors"] as? [String],
            let watchers = dict["watchers"] as? [String]
        else { return nil }
        
        // Create the content
        var content = [NoteContent]()
        for contentDict in contentDicts {
            // Create and append the content depending on its type
            if contentDict["type"] as? String ?? "" == "checklist" {
                
                content.append(ChecklistNoteContent(fromDict: contentDict))
            } else {
                
                content.append(TextNoteContent(fromDict: contentDict))
            }
        }

		// Return the note
        return Note(id: id, content: content, archived: archived,
                    ownerId: ownerId, editors: editors, watchers: watchers)
	}
}
