import Foundation
import SwiftUI
import UIKit

import Architecture
import Services
import Models

class VersionsCoordinator: Coordinator {

    var router: Router?
    let versions: [Version]

    internal init(versions: [Version]) {
        self.versions = versions
    }

    var contentView: some View {
        VersionsView(versions: versions,
                     viewModel: VersionsViewModel(coordinator: self))
    }

}
