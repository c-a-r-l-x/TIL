import SwiftUI

struct AddThingView: View {
  @EnvironmentObject private var someThings: ThingStore
  @State private var short = ""
  @State private var long = ""
  @FocusState private var thingIsFocused: Bool
  @Environment(\.dismiss) var dismiss
  
  func saveAndExit() {
    if !short.isEmpty {
      someThings.things.append(
        Thing(short: short, long: long)
      )
    }
    dismiss()
  }
  
  var body: some View {
    VStack {
      TextField("TIL", text: $short)
        .autocapitalization(.allCharacters)
        .disableAutocorrection(true)
        .focused($thingIsFocused)
        .onAppear { thingIsFocused = true }
      TextField("Thing I Learned", text: $long, onCommit: { saveAndExit() })
        .autocapitalization(.words)
      Button("Done") {
        saveAndExit()
      }
      Spacer()
    }
    .textFieldStyle(.roundedBorder)
    .padding()
  }
}

#Preview {
  AddThingView()
    .environmentObject(ThingStore())
}
