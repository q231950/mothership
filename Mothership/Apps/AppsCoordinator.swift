import Foundation
import SwiftUI
import ArchitectureX
import UIKit

class AppsCoordinator: Coordinator {

    let navigator: Navigator

    init(navigator: Navigator) {
        self.navigator = navigator
    }

    var view: some View {
        AppsView(viewModel: AppsViewModel(), interactor: AppsInteractor(coordinator: self))
    }


}
