import Foundation
import ArchitectureX
import Services
import Models
import UIKit

struct AppsInteractor: Interactor {

    var coordinator: AppsCoordinator

    func showApp(_ app: App) {
        let repository = RemoteAppRepository(baseUrl: Configuration.API.baseURL, uuid: app.uuid)
        coordinator.transition(.push) { AppCoordinator(navigator: $0, app: app, repository: repository) }
    }

    func deleteApp(_ uuid: UUID) {
        coordinator.repository.deleteApp(uuid)
    }

}
