import SwiftUI
import ArchitectureX

@main
struct MothershipApp: App {

    private var coordinator: RootCoordinator<HomeCoordinator> = {
        let navigationController = UINavigationController()

        let navigator = Navigator(navigationController: navigationController)
        let rootCoordinator = RootCoordinator(root: HomeCoordinator(navigator: navigator),
                                              navigationController: navigationController)

        return rootCoordinator
    }()

    var body: some Scene {
        WindowGroup {
            coordinator.view
                .ignoresSafeArea()
        }
    }
}

class RootCoordinator<Root: Coordinator>: Coordinator {

    let navigator: Navigator
    let root: Root
    let navigationController: UINavigationController

    init(root: Root, navigationController: UINavigationController) {
        self.root = root
        self.navigator = root.navigator
        self.navigationController = navigationController
    }

    var view: some View {
        let hostedCoordinatorView = UIHostingController(rootView: root.view)

        navigator.navigationController.setViewControllers([hostedCoordinatorView], animated: false)

        return ViewControllerContainer(viewController: navigator.navigationController)
    }
}
