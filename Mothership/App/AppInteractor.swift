import Foundation
import ArchitectureX
import UIKit

struct AppInteractor: Interactor {
    let coordinator: AppCoordinator

    func install(_ uuid: UUID) {
        guard let url = URL(string: "itms-services://?action=download-manifest&url=\(Configuration.Manifest.downloadURL)/install/\(uuid.uuidString)") else { return }

        print("\(url)")

        UIApplication.shared.open(url)
    }
}
