import Foundation

///
/// https://nshipster.com/xcconfig/
///
enum Configuration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }

}

extension Configuration {

    enum API {
        static var baseURL: URL {
            try! URL(string: Configuration.value(for: "API_BASE_URL"))!
        }
    }

    enum Manifest {
        static var downloadURL: URL {
            try! URL(string: Configuration.value(for: "MANIFEST_DOWNLOAD_URL"))!
        }
    }

}
