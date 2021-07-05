import Foundation

public struct Build: Decodable, Identifiable {
    public var id: UUID {
        uuid
    }

    public let uuid: UUID
    public let tag: String
    public let title: String
    public let createdAt: String
    public let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case uuid = "id"
        case tag
        case title
        case createdAt
        case updatedAt
    }
}
