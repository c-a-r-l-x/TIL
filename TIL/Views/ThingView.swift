import SwiftUI

struct ThingView: View {
  let thing: Thing
  
  var body: some View {
    VStack {
      Text(thing.short)
      Text(thing.long)
      Spacer()
    }
    .padding()
  }
}

#Preview {
  ThingView(thing: Thing(short: "TIL", long: "Thing I Learned"))
}
