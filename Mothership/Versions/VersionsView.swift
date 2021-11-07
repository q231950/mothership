import SwiftUI
import Models

struct VersionsView: View {

    let versions: [Version]
    let viewModel: VersionsViewModel
    let title = "Versions"

    var body: some View {
        List {
            ForEach(versions) { version in
                Text(" v\(version.major).\(version.minor).\(version.patch)")
                    .font(.caption2)
                    .bold()
            }
        }
        .navigationTitle("Versions")
        .navigationBarItems(trailing:
                                Button(action: {
            viewModel.dismiss()
        }) {
            Image(systemName: "xmark.circle")
                .scaleEffect(1.3)
        })
    }
}
