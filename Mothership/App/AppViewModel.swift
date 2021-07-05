import Foundation
import Combine

import Models

class AppViewModel: ObservableObject {

    @Published var app: App
    @Published var uploads = [Upload]()

    private var cancellables = Set<AnyCancellable>()

    init(app: App, uploads: CurrentValueSubject<[Upload], Error>) {
        self.app = app

        uploads.receive(on: RunLoop.main)
            .sink { error in

            } receiveValue: { value in
                self.uploads = value
            }.store(in: &cancellables)
    }

    let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
