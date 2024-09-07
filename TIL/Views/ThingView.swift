import SwiftUI

struct ThingView: View {
  let thing: Thing
  @State private var showAddThing = false
  
  var body: some View {
    VStack {
      Text(thing.short)
      Text(thing.long)
      Spacer()
    }
    .padding()
    .sheet(isPresented: $showAddThing) {
      AddThingView()
    }
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
}

#Preview {
  ThingView(thing: Thing(short: "TIL", long: "Thing I Learned"))
}
