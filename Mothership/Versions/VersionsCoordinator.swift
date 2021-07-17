import Foundation
import SwiftUI
import UIKit

import ArchitectureX
import Services
import Models

class VersionsCoordinator: Coordinator {

    let navigator: Navigator
    let versions: [Version]

    internal init(navigator: Navigator, versions: [Version]) {
        self.navigator = navigator
        self.versions = versions
    }

    var view: some View {
        VersionsView(versions: versions,
                     interactor: VersionsInteractor(coordinator: self))
    }

}
