import Foundation
import SwiftUI
import UIKit

import ArchitectureX
import Services
import Models

class AppCoordinator: Coordinator {

    let navigator: Navigator
    let app: Models.App
    let repository: AppRepository

    internal init(navigator: Navigator, app: Models.App, repository: AppRepository) {
        self.navigator = navigator
        self.app = app
        self.repository = repository
    }

    var view: some View {
        AppView(viewModel: AppViewModel(app: app, uploads: repository.uploads, versions: repository.versions), interactor: AppInteractor(coordinator: self))
    }

}
