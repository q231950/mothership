import ArchitectureX
import UIKit
import Services

struct HomeInteractor: Interactor {
    var coordinator: HomeCoordinator

    func showApps() {
        let repository = RemoteAppsRepository(baseUrl: Configuration.API.baseURL)
        coordinator.transition(.present(modalInPresentation: false)) {
            AppsCoordinator(navigator: $0, repository: repository)
        }
    }

    func showInfo() {
        coordinator.transition(.present(modalInPresentation: false), to: InfoCoordinator.init(navigator:))
    }
}
