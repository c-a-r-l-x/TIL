import Foundation

final class ThingStore: ObservableObject {
  @Published var things: [Thing] = []
}

struct Thing: Identifiable {
  let id = UUID()
  let short: String
  let long: String
}
