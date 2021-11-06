import Combine
import Foundation

import Models
import Services

class AppsViewModel: ObservableObject {

    enum AppsState {
        case initial
        case loading
        case done([App])
        case error
    }

    @Published var state: AppsState = .initial
    var coordinator: AppsCoordinator

    private var cancelables = Set<AnyCancellable>()

    init(coordinator: AppsCoordinator, apps: CurrentValueSubject<[App], Error>) {
        self.coordinator = coordinator

        DispatchQueue.main.async {
            self.state = .loading
        }
        apps
            .debounce(for: 1.0, scheduler: RunLoop.main)
            .sink { [weak self] error in
                print("\(error)")
                self?.state = .error
            } receiveValue: { [weak self] value in
                self?.state = .done(value)
            }.store(in: &cancelables)

    }

    func showApp(_ app: App) {
        let repository = RemoteAppRepository(baseUrl: Configuration.API.baseURL, uuid: app.uuid)
        coordinator.transition(.push, to: AppCoordinator(app: app, repository: repository))
    }

    func deleteApp(_ uuid: UUID) {
        coordinator.repository.deleteApp(uuid)
    }

    func loadApps() {
        coordinator.repository.loadApps()
    }

    func dismiss() {
        coordinator.dismiss()
    }
}
