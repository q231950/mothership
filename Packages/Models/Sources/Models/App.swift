import Foundation

public struct App: Decodable, Identifiable {
    public var id: UUID {
        uuid
    }

    public let uuid: UUID
    public let bundleIdentifier: String
    public let name: String
//    public let createdAt: Date
//    public let updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case uuid = "id"
        case bundleIdentifier
        case name
//        case createdAt
//        case updatedAt
    }
}
