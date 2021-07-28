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

        return HomeView(viewModel: HomeViewModel(), interactor: interactor)
    }


}
