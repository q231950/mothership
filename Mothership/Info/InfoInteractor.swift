import ArchitectureX
import Services
import UIKit

struct InfoInteractor: Interactor {

    var coordinator: InfoCoordinator

    func installNewestMothershipApp() {
        let installer = Installer(baseUrl: Configuration.Manifest.downloadURL)
        if let url = installer.stableMothershipAppInstallUrl() {
            UIApplication.shared.open(url)
        }
    }

    func dismiss() {
        coordinator.dismiss()
    }
}
