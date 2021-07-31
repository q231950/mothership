import Foundation
import ArchitectureX
import UIKit
import Models
import Services

struct AppInteractor: Interactor {
    let coordinator: AppCoordinator

    /// installs an upload's build
    func install(_ uuid: UUID) {
        let installer = Installer(baseUrl: Configuration.Manifest.downloadURL)
        if let url = installer.installUrl(for: uuid) {
            UIApplication.shared.open(url)
        }
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
