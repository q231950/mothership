import Foundation
import Models
import Combine

class AppsViewModel: ObservableObject {

    @Published var apps = [App]()

    private var cancelables = Set<AnyCancellable>()

    init(apps: CurrentValueSubject<[App], Error>) {
        apps.receive(on: RunLoop.main)
            .sink { error in
                print("\(error)")
            } receiveValue: { value in
                self.apps = value
            }.store(in: &cancelables)

    }
}
