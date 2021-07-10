import Foundation

public struct Upload: Decodable, Identifiable {
    public var id: UUID {
        uuid
    }

    public let uuid: UUID
    public let build: Build
    public let version: Version

    enum CodingKeys: String, CodingKey {
        case uuid = "id"
        case build
        case version
    }
}
