// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

public struct ContentView: View {
    public init() {
    }
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("This is a text originally written in English")
            Text("this text has a German translation in the catalog", bundle: .module)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

