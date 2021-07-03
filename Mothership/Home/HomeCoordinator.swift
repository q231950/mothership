import Foundation
import SwiftUI
import ArchitectureX
import UIKit

struct HomeCoordinator: Coordinator {

    let navigator: Navigator

    var view: some View {
        let interactor = HomeInteractor(coordinator: self)
        let homeView = HomeView(viewModel: HomeViewModel(), interactor: interactor)
        let hostedCoordinatorView = UIHostingController(rootView: homeView)

        navigator.navigationController.setViewControllers([hostedCoordinatorView], animated: true)

        return ViewControllerContainer(viewController: navigator.navigationController)
    }


}
