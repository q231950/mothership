import Foundation
import SwiftUI
import UIKit

import Architecture
import Services

class AppsCoordinator: Coordinator {

    let repository: AppsRepository
    var router: Router?

    internal init(repository: AppsRepository) {
        self.repository = repository
    }

    var contentView: some View {
        AppsView(viewModel: AppsViewModel(coordinator: self, apps: repository.apps))
    }
}
