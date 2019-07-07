//
//  ContentView.swift
//  swiftui-notes
//
//  Created by Nikolaos Rafail Nikolouzos on 07/07/2019.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import SwiftUI

struct ContentView : View {

	@State var notes = [String: Note]()

	var body: some View {
		return Text("Hello world")
	}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
#endif
