import Foundation

final class ThingStore: ObservableObject {
  @Published var things: [String] = []
}
