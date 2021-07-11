import Foundation
import Combine

import Models

class AppViewModel: ObservableObject {

    @Published var app: App
    @Published var uploads = [Upload]()
    @Published var versions = [Version]()

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

            } receiveValue: { value in
                self.versions = value
            }.store(in: &cancellables)
    }

    let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
