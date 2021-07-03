import ArchitectureX

struct InfoInteractor: Interactor {

    var coordinator: InfoCoordinator

    func dismiss() {
        coordinator.dismiss()
    }
}
