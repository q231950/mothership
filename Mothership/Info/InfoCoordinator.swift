import SwiftUI
import ArchitectureX

class InfoCoordinator: Coordinator {

    var navigator: Navigator

    init(navigator: Navigator) {
        self.navigator = navigator
    }

    var view: some View {
        let interactor = InfoInteractor(coordinator: self)

        return InfoView(interactor: interactor)
    }
}
