import SwiftUI
import Architecture

@main
struct MothershipApp: App {

    var body: some Scene {
        WindowGroup {
            HomeCoordinator()
                .view
                .containInNavigation
                .ignoresSafeArea()
        }
    }
}
