import Foundation

public struct App: Hashable, Decodable {
    public let bundleIdentifier: String = "dev.neoneon.mothership"
    public let updateDate: Date = Date()

    public init() {}
}
