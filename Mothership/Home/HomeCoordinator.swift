import Foundation
import SwiftUI
import Architecture
import UIKit

class HomeCoordinator: Coordinator {

    var router: Router? = Router()

    var contentView: some View {
        HomeView(viewModel: HomeViewModel(coordinator: self))
    }
}
