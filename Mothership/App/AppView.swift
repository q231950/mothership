import SwiftUI
import Models

struct AppView: View {

    let title: String
    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        List {
            AppSection(viewModel: viewModel)

            VersionsSection(viewModel: viewModel)

            UploadsSection(viewModel: viewModel)
        }
    }
}
