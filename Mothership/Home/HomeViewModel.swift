import Combine
import Foundation
import Services

class HomeViewModel: ObservableObject {

    @Published var title: String = "Internal Apps"
    private let coordinator: HomeCoordinator

    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.title = "Mothership \((1..<10).randomElement() ?? 0)"
        }
    }

    func showApps() {
        let repository = RemoteAppsRepository(baseUrl: Configuration.API.baseURL)
        coordinator.transition(.fullscreenModal, to: AppsCoordinator(repository: repository))
    }

    func showInfo() {
        coordinator.transition(.present(modalInPresentation: false), to: InfoCoordinator())
    }


}
