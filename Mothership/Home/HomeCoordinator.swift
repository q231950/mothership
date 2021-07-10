import Foundation
import SwiftUI
import ArchitectureX
import UIKit

class HomeCoordinator: Coordinator {

    let navigator: Navigator

    internal init(navigator: Navigator) {
        self.navigator = navigator
    }

    var view: some View {
        let interactor = HomeInteractor(coordinator: self)
        let homeView = HomeView(viewModel: HomeViewModel(), interactor: interactor)
        let hostedCoordinatorView = UIHostingController(rootView: homeView)

        navigator.navigationController.setViewControllers([hostedCoordinatorView], animated: true)

        return ViewControllerContainer(viewController: navigator.navigationController)
    }


}
