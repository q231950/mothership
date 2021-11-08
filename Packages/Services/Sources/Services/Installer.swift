import Foundation
import UIKit

public struct Installer {

    let baseUrl: URL

    public init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }

    /// <#Description#>
    /// - Parameter uuid: <#uuid description#>
    /// - Returns: <#description#>
    public func installUrl(for uuid: UUID) -> URL? {
        URL(string: "itms-services://?action=download-manifest&url=\(baseUrl)/install/\(uuid.uuidString)/install.plist")
    }

    public func stableMothershipAppInstallUrl() -> URL? {
        URL(string: "itms-services://?action=download-manifest&url=\(baseUrl)/install/stable-mothership/install.plist")
    }
}
