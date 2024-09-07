import SwiftUI

@main
struct TILApp: App {
  @StateObject private var store = ThingStore()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(store)
    }
  }
}
