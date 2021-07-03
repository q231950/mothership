import SwiftUI
import ArchitectureX

@main
struct MothershipApp: App {

    let coordinator = HomeCoordinator(navigator: Navigator(navigationController: UINavigationController()))

    var body: some Scene {
        WindowGroup {
            coordinator.view
                .ignoresSafeArea()
        }
    }
}
