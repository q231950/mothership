import Foundation
import SwiftUI
import UIKit

import Architecture
import Services
import Models

class AppCoordinator: Coordinator {

    var router: Router?
    let app: Models.App
    let repository: AppRepository

    internal init(app: Models.App, repository: AppRepository) {
        self.app = app
        self.repository = repository
    }

    var contentView: some View {
        let viewModel = AppViewModel(coordinator: self,
                                     app: app,
                                     uploads: repository.uploads,
                                     versions: repository.versions)

        return AppView(title: app.name, viewModel: viewModel)
    }

}
