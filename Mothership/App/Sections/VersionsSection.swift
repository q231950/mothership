import Foundation
import SwiftUI

import Models

struct VersionsSection: View {

    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        Section {
            ForEach(viewModel.versionsSample) {
                Text("v\($0.major).\($0.minor).\($0.patch)")
                    .font(.body)
                    .bold()
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }

            if viewModel.hasMoreVersions {
                Button(action: {
                    viewModel.showVersions(viewModel.versions)
                }) {
                    HStack {
                        Text("All Versions")
                            .font(.body)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))

                        Spacer()

                        Image(systemName: "square.stack.3d.down.forward")
                            .scaleEffect(1.1)
                    }
                }
            }
        }
    }
}
