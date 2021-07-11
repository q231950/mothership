import Combine
import Foundation

class HomeViewModel: ObservableObject {

    @Published var title: String = "Internal Apps"

    init() {
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
//            self.title = "Mothership \((1..<10).randomElement() ?? 0)"
//        }
    }

}
