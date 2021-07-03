import Foundation
import Models

class AppsViewModel: ObservableObject {

    @Published var apps: [App] = [App(), App()]
}
