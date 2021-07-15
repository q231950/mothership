import Foundation
import SwiftUI

import Models

struct AppSection: View {

    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        Section {
            AppCard(app: viewModel.app)
        }
    }

    private struct AppCard: View {
        let app: Models.App

        var body: some View {

            VStack(alignment: .leading) {
                Text(app.name)
                    .font(.title3)

                Text(app.bundleIdentifier)
                    .font(.body)
                    .bold()
            }
            .frame(minHeight: 100)
            .cornerRadius(10)
        }
    }
}
