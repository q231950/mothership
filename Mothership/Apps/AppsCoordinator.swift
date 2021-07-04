import Foundation
import SwiftUI
import UIKit

import ArchitectureX
import Services

struct AppsCoordinator: Coordinator {

    let navigator: Navigator
    let repository: AppRepository

    var view: some View {
        AppsView(viewModel: AppsViewModel(apps: repository.apps), interactor: AppsInteractor(coordinator: self))
    }

}
