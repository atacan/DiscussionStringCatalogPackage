//
// https://github.com/atacan
// 19.03.24
	

import SwiftUI
import DiscussionStringCatalogPackage

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("This is a text in the app, not in the package.")
            DiscussionStringCatalogPackage.ContentView()
        } // <-VStack
    }
}

#Preview {
    ContentView()
}
