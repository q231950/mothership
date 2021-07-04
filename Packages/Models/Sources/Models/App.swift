import Foundation

public struct App: Hashable {
    public let uuid = UUID()
    public let bundleIdentifier: String = "dev.neoneon.mothership"
    public let updateDate: Date = Date()

    public init() {}
}
