import SwiftUI
import ArchitectureX

struct InfoCoordinator: Coordinator {

    var navigator: Navigator

    var view: some View {
        let interactor = InfoInteractor(coordinator: self)

        return InfoView(interactor: interactor)
    }
}
