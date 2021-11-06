import SwiftUI
import Architecture

class InfoCoordinator: Coordinator {

    var router: Router?

    var contentView: some View {
        InfoView(viewModel: InfoViewModel(coordinator: self))
    }
}
