import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!").onAppear {
                createNode()
                LinkedListOperation().perform()
                CopyOnWrite().perform()
                StackOperation().perform()
                QueueArrayOperation().perform() 
            }
        }
    }
}
