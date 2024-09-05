import SwiftUI

struct AddThingView: View {
  @State private var thing = ""
  @Binding var someThings: ThingStore
  @FocusState private var thingIsFocused: Bool
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack {
      TextField("Thing I Learned", text: $thing)
        .textFieldStyle(.roundedBorder)
        .padding()
        .autocapitalization(.allCharacters)
        .disableAutocorrection(true)
        .focused($thingIsFocused)
        .onAppear { thingIsFocused = true }
      Button("Done") {
        if !thing.isEmpty {
          someThings.things.append(thing)
        }
        dismiss()
      }
      Spacer()
    }
  }
}

#Preview {
  AddThingView(someThings: .constant(ThingStore()))
}
