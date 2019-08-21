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
	var title: String?
	var content: String?
	var finished: Bool?

	/// Maps a dictionary containing a note to a Note object
	/// If the ID is non-existent this will fail.
	static func map(fromDict dict: [String: Any]) -> Note? {

		// Make sure that the note has an id
		guard let id = dict["id"] as? String else { return nil }

		// Get the rest of the values
		let title = dict["title"] as? String
		let content = dict["content"] as? String
		let finished = dict["finished"] as? Bool

		// Return the note
		return Note(id: id, title: title,
					content: content, finished: finished)
	}
}
