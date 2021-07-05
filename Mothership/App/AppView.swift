import SwiftUI
import Models

struct AppView: View {

    @ObservedObject var viewModel: AppViewModel
    let interactor: AppInteractor

    var body: some View {
        VStack(alignment: .leading) {

            AppCard(app: viewModel.app)

            List(viewModel.uploads) { upload in
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(upload.build.title)

                            Text(upload.build.tag)
                                .font(.caption)
                        }

                        Spacer()

                        Button(action: {
                            interactor.install(upload.uuid)
                        }) {
                            Image(systemName: "arrow.down.circle")
                        }
                    }

                    Spacer()
                        .frame(width: 2, height: 10, alignment: .leading)

                    Text(upload.build.updatedAt)
                        .font(.caption)
                }
            }
            .listStyle(.insetGrouped)
        }
        .navigationTitle("Builds")
    }
}

struct AppCard: View {
    let app: Models.App

    var body: some View {

        VStack(alignment: .leading) {
            Text(app.name)
                .font(.headline)

            Text(app.bundleIdentifier)
                .font(.caption)
        }
        .cornerRadius(10)
        .padding()

    }
}
