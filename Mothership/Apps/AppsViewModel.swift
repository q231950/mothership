import Foundation
import Models
import Combine

class AppsViewModel: ObservableObject {

    enum AppsState {
        case initial
        case loading
        case done([App])
        case error
    }

    @Published var state: AppsState = .initial

    private var cancelables = Set<AnyCancellable>()

    init(apps: CurrentValueSubject<[App], Error>) {
        DispatchQueue.main.async {
            self.state = .loading
        }
        apps.receive(on: RunLoop.main)
            .sink { [weak self] error in
                print("\(error)")
                self?.state = .error
            } receiveValue: { [weak self] value in
                self?.state = .done(value)
            }.store(in: &cancelables)

    }
}
