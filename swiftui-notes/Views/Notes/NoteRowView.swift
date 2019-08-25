//
//  NoteRowView.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 25/8/19.
//  Copyright © 2019 NIKOLOUZOS LTD. All rights reserved.
//

import SwiftUI

struct NoteRowView: View {
    
    @State var note: Note
    
    var body: some View {
        Text("Hello World!")
    }
}

#if DEBUG
struct NoteRowViewPreviews: PreviewProvider {
    
    static var previews: some View {
        
        // A sample Note dictionary
        let noteDict = [ "noteId":
                [
                    "archived": false,
                    "id": "noteId",
                    "owner": "ownerId",
                    "editors": [
                        "editor1"
                    ],
                    "watchers": [
                        "watcher1"
                    ],
                    "content": [
                        [
                            "type": "text",
                            "value": "This is some note text"
                        ],
                        [
                            "type": "checklist",
                            "value": [
                                "this is checked",
                                "check this later"
                            ],
                            "checked": [
                                true,
                                false
                            ]
                        ]
                    ]
                ]
            ]
        
       return NoteRowView(note: Note.map(fromDict: noteDict)!)
    }
}
#endif
