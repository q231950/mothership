import Foundation

public struct App: Decodable, Identifiable {
    public var id: UUID {
        uuid
    }

    public let uuid: UUID
    public let bundleIdentifier: String
    public let name: String

    enum CodingKeys: String, CodingKey {
        case uuid = "id"
        case bundleIdentifier
        case name
    }
}
