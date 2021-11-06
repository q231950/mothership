import Foundation
import SwiftUI

import Models

struct UploadsSection: View {

    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        Section {
            ForEach(viewModel.uploads) { upload in
                UploadView(upload: upload, viewModel: viewModel)
            }
            .onDelete { indexSet in
                indexSet.first.map { viewModel.delete(viewModel.uploads[$0].uuid) }
            }
        }
    }

    private struct UploadView: View {
        let upload: Upload
        let viewModel: AppViewModel

        var body: some View {
            VStack(alignment: .leading) {
                Text(upload.build.title)
                    .font(.body)
                    .bold()
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 4, trailing: 0))

                HStack {
                    HStack {
                        Text(upload.build.tag)
                            .font(.caption2)
                            .bold()

                        Text(" v\(upload.version.major).\(upload.version.minor).\(upload.version.patch)")
                            .font(.caption2)
                            .bold()

                        Text("(\(upload.build.buildNumber))")
                            .font(.caption2)
                            .bold()
                    }

                    Spacer()

                    Button(action: {
                        viewModel.install(upload.uuid)
                    }) {
                        Image(systemName: "arrow.down.circle")
                            .scaleEffect(1.1)
                    }
                }

                Spacer()
                    .frame(width: 2, height: 10, alignment: .leading)

                Text(upload.build.updatedAt)
                    .font(.caption)
            }
        }
    }
}
