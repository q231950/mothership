import Foundation

public struct Version: Decodable, Identifiable {
    public var id: UUID {
        uuid
    }

    public let uuid: UUID
    public let minor: Int
    public let major: Int
    public let patch: Int

    enum CodingKeys: String, CodingKey {
        case uuid = "id"
        case minor
        case major
        case patch
    }
}
