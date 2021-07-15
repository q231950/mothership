import Foundation
import SwiftUI

import Models

struct UploadsSection: View {

    @ObservedObject var viewModel: AppViewModel
    let interactor: AppInteractor

    var body: some View {
        Section {
            ForEach(viewModel.uploads) { upload in
                BuildView(upload: upload, interactor: interactor)
            }
            .onDelete { indexSet in
                indexSet.first.map { interactor.delete(viewModel.uploads[$0].uuid) }
            }
        }
    }

    private struct BuildView: View {
        let upload: Upload
        let interactor: AppInteractor

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
                        interactor.install(upload.uuid)
                    }) {
                        Image(systemName: "arrow.down.circle")
                            .scaleEffect(1.3)
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
