//
//  NoteRow.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 09/07/2019.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import SwiftUI

struct NoteRow : View {
	@State var note: Note

    var body: some View {
		return VStack(alignment: .center, spacing: 8, content: {
			HStack(alignment: .center, spacing: 16, content: {
				Text(note.title ?? "")
				Spacer()
				Image("tick-box")
			})
			Divider()
			Text(note.content ?? "")
		})
    }
}

#if DEBUG
struct NoteRow_Previews : PreviewProvider {
    static var previews: some View {
		let testNote = Note(
			id: "123",
			title: "This is a test note",
			content: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Fusce gravida nulla tortor, nec sollicitudin tortor.
""",
			finished: false)

        return NoteRow(note: testNote)
    }
}
#endif
