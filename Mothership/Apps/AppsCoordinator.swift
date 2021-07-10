import Foundation
import SwiftUI
import UIKit

import ArchitectureX
import Services

class AppsCoordinator: Coordinator {

    let navigator: Navigator
    let repository: AppsRepository

    internal init(navigator: Navigator, repository: AppsRepository) {
        self.navigator = navigator
        self.repository = repository
    }

    var view: some View {
        AppsView(viewModel: AppsViewModel(apps: repository.apps), interactor: AppsInteractor(coordinator: self))
    }

}
