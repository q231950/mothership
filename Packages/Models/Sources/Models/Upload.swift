import Foundation

public struct Upload: Decodable, Identifiable {
    public var id: UUID {
        uuid
    }

    public let uuid: UUID
    public let build: Build

    enum CodingKeys: String, CodingKey {
        case uuid = "id"
        case build
    }
}
