import ArchitectureX
import UIKit

struct HomeInteractor: Interactor {
    var coordinator: HomeCoordinator

    func showApps() {
        let navigator = Navigator(navigationController: UINavigationController(), prefersLargeTitles: false)

        coordinator.transition(.push) { _ in AppsCoordinator(navigator: navigator) }
    }

    func showInfo() {
        coordinator.transition(.present(modalInPresentation: false), to: InfoCoordinator.init(navigator:))
    }
}
