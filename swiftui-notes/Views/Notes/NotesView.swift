//
//  NotesView.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 07/07/2019.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct NotesView: View {
    
    @EnvironmentObject var router: AppRouter

	@State var notes = [Note]()
	@State var notesListener: ListenerRegistration?

	var body: some View {
		return VStack {
            HStack {
                Text("My Notes")
                    .font(.largeTitle)
            }
            Divider()
			List(notes) { note in
				NoteRow(note: note)
			}
		}
			.onAppear {
				self.observeNotes()
		}
			.onDisappear {
				self.stopObservingNotes()
		}
	}

	/// Starts observing the user's notes
	func observeNotes() {
		// TODO: Target the specific user's notes
			notesListener = db.collection("notes").addSnapshotListener { (snapshot, error) in
				if let snapshot = snapshot {
					var notes = [Note]()

					// Parse the notes
					for doc in snapshot.documents {
						// Get all the valid notes and add them to an array
						if let note = Note.map(fromDict: doc.data()) {
							notes.append(note)
						}

						// Update the notes on the ContentView
						self.notes = notes
					}
				}
		}
	}

	/// Stops observing the user's notes
	func stopObservingNotes() { notesListener?.remove() }
}

#if DEBUG
struct ContentViewPreviews: PreviewProvider {
	static var previews: some View {
        NotesView().environmentObject(AppRouter())
	}
}
#endif
