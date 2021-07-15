import Foundation
import Combine

import Models

class AppViewModel: ObservableObject {

    @Published var app: App
    @Published var uploads = [Upload]()
    @Published var versions = [Version]()
    @Published var versionsSample = [Version]()
    @Published var hasMoreVersions = false

    private let maxSampleCount = 2
    private var cancellables = Set<AnyCancellable>()

    init(app: App, uploads: CurrentValueSubject<[Upload], Error>, versions: CurrentValueSubject<[Version], Error>) {
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
}
