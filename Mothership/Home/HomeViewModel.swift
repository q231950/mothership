import Combine
import Foundation
import Services

class HomeViewModel: ObservableObject {

    @Published var title: String = "Internal Apps"
    private let coordinator: HomeCoordinator

    /// <#Description#>
    /// - Parameter coordinator: <#coordinator description#>
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.title = "Mothership \((1..<10).randomElement() ?? 0)"
        }
    }

    func showApps() {
        let repository = RemoteAppsRepository(baseUrl: Configuration.API.baseURL)
        coordinator.transition(to: AppsCoordinator(repository: repository), style: .fullscreenModal)
    }

    func showInfo() {
        coordinator.transition(to: InfoCoordinator(), style: .present(modalInPresentation: false))
    }


}
