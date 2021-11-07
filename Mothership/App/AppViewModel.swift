import Combine
import Foundation
import UIKit

import Models
import Services

class AppViewModel: ObservableObject {

    @Published var app: App
    @Published var uploads = [Upload]()
    @Published var versions = [Version]()
    @Published var versionsSample = [Version]()
    @Published var hasMoreVersions = false

    private let maxSampleCount = 1
    private var cancellables = Set<AnyCancellable>()
    private var coordinator: AppCoordinator

    init(coordinator: AppCoordinator, app: App, uploads: CurrentValueSubject<[Upload], Error>, versions: CurrentValueSubject<[Version], Error>) {
        self.coordinator = coordinator
        self.app = app

        uploads.receive(on: RunLoop.main)
            .sink { error in

            } receiveValue: { value in
                self.uploads = value
            }.store(in: &cancellables)

        versions.receive(on: RunLoop.main)
            .sink { error in

            } receiveValue: { [weak self] value in
                guard let self = self else { return }

                self.versions = value
                self.versionsSample = Array(value.prefix(self.maxSampleCount))

                self.hasMoreVersions = self.versions.count > self.versionsSample.count
            }.store(in: &cancellables)
    }

    let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()

    /// installs an upload's build
    func install(_ uuid: UUID) {
        let installer = Installer(baseUrl: Configuration.Manifest.downloadURL)
        if let url = installer.installUrl(for: uuid) {
            UIApplication.shared.open(url)
        }
    }

    /// deletes an upload
    func delete(_ uuid: UUID) {
        coordinator.repository.delete(uuid)
    }

    func showVersions(_ versions: [Version]) {
        coordinator.transition(.present(modalInPresentation: false), to: VersionsCoordinator(versions: versions))
    }
}
