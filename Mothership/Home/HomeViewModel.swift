import Combine
import Foundation

class HomeViewModel: ObservableObject {

    @Published var title: String = "Mothership"

    init() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            self.title = "Mothership \((1..<10).randomElement() ?? 0)"
        }
    }

}
