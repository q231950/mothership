import SwiftUI
import Models

struct AppView: View {

    let title: String
    @ObservedObject var viewModel: AppViewModel
    let interactor: AppInteractor

    var body: some View {
        List {
            AppSection(viewModel: viewModel)

            VersionsSection(viewModel: viewModel, interactor: interactor)

            UploadsSection(viewModel: viewModel, interactor: interactor)
        }
        .listStyle(.insetGrouped)
    }
}
