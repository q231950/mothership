import Foundation
import SwiftUI
import ArchitectureX

struct AppsView: View {
    let interactor: AppsInteractor

    var body: some View {
        Text("Apps")
        .navigationTitle("Apps")
    }
}

struct AppsView_Preview: PreviewProvider {
    static var previews: some View {
        AppsView(interactor: AppsInteractor(coordinator: AppsCoordinator(navigator: Navigator(navigationController: UINavigationController()))))
    }
}
