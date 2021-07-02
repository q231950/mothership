import ArchitectureX

struct HomeInteractor: Interactor {
    var coordinator: HomeCoordinator

    func next() {
        coordinator.navigator.transition(.present(modalInPresentation: false)) { AppsCoordinator(navigator: $0) }
    }
}
