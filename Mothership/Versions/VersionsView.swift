import SwiftUI
import Models

struct VersionsView: View {

    let versions: [Version]
    let interactor: VersionsInteractor
    let title = "Versions"

    var body: some View {
        List {
            ForEach(versions) { version in
                Text(" v\(version.major).\(version.minor).\(version.patch)")
                    .font(.caption2)
                    .bold()
            }
        }
        .listStyle(.plain)
    }
}
