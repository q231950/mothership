import SwiftUI
import Models

struct AppView: View {

    @ObservedObject var viewModel: AppViewModel
    let interactor: AppInteractor

    var body: some View {
        List {
            AppSection(viewModel: viewModel)

            VersionsSection(viewModel: viewModel)

            UploadsSection(viewModel: viewModel, interactor: interactor)
        }
        .listStyle(.insetGrouped)
        .navigationTitle(viewModel.app.name)
    }
}
