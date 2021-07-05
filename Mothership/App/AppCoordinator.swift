import Foundation
import SwiftUI
import UIKit

import ArchitectureX
import Services
import Models

struct AppCoordinator: Coordinator {

    let navigator: Navigator
    let app: Models.App
    let repository: AppRepository

    var view: some View {
        AppView(viewModel: AppViewModel(app: app, uploads: repository.uploads), interactor: AppInteractor(coordinator: self))
    }

}
