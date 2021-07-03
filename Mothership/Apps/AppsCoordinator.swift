import Foundation
import SwiftUI
import ArchitectureX
import UIKit

struct AppsCoordinator: Coordinator {

    let navigator: Navigator

    var view: some View {
        AppsView(viewModel: AppsViewModel(), interactor: AppsInteractor(coordinator: self))
    }

}
