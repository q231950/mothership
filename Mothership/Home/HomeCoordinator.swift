import Foundation
import SwiftUI
import ArchitectureX
import UIKit

class HomeCoordinator: Coordinator {

    let navigator: Navigator

    init(navigator: Navigator) {
        self.navigator = navigator
    }

    var view: some View {
        let interactor = HomeInteractor(coordinator: self)
        let hostedCoordinatorView = UIHostingController(rootView: HomeView(interactor: interactor))

        navigator.navigationController.setViewControllers([hostedCoordinatorView], animated: true)
        navigator.navigationController.navigationBar.prefersLargeTitles = true

        return ViewControllerContainer(viewController: navigator.navigationController)
    }


}
