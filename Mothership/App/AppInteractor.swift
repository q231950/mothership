import Foundation
import ArchitectureX
import UIKit
import Models

struct AppInteractor: Interactor {
    let coordinator: AppCoordinator

    /// installs an upload's build
    func install(_ uuid: UUID) {
        guard let url = URL(string: "itms-services://?action=download-manifest&url=\(Configuration.Manifest.downloadURL)/install/\(uuid.uuidString)/install.plist") else { return }

        UIApplication.shared.open(url)
    }

    /// deletes an upload
    func delete(_ uuid: UUID) {
        coordinator.repository.delete(uuid)
    }

    func showVersions(_ versions: [Version]) {
        coordinator.transition(.push) { navigator in
            VersionsCoordinator(navigator: navigator, versions: versions)
        }
    }
}
