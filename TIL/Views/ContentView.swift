import SwiftUI

struct ContentView: View {
  @StateObject private var myThings = ThingStore()
  @State private var showAddThing = false
  
  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        if myThings.things.isEmpty {
          Text("Add acronyms you learn")
            .foregroundColor(.gray)
        }
        ForEach(myThings.things) { thing in
          NavigationLink(destination: ThingView(thing: thing)) {
            Text(thing.short)
          }
        }
        Spacer()
      }
      .navigationTitle("TIL")
      .toolbar {
        ToolbarItem {
          Button(action: {
            showAddThing.toggle()
          }, label: {
            Image(systemName: "plus.circle")
              .font(.title)
          })
        }
      }
    }
    .sheet(isPresented: $showAddThing) {
      AddThingView(someThings: myThings)
    }
  }
}

#Preview {
  ContentView()
}
