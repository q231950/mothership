import Foundation
import Architecture

struct VersionsViewModel {
    let coordinator: VersionsCoordinator

    func dismiss() {
        coordinator.dismiss()
    }
}
