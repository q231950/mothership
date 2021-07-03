import Foundation
import SwiftUI
import ArchitectureX

struct AppsView: View {

    @ObservedObject var viewModel: AppsViewModel
    let interactor: AppsInteractor

    var body: some View {
        List(viewModel.apps, id: \.self) {
            Text($0.bundleIdentifier)
        }
        .navigationTitle("Apps")
    }
}
