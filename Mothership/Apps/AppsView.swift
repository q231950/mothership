import Foundation
import SwiftUI
import ArchitectureX
import Models

struct AppsView: View {

    @ObservedObject var viewModel: AppsViewModel
    let interactor: AppsInteractor

    let title = "Apps"
    let displayMode: NavigationBarItem.TitleDisplayMode = .large

    var body: some View {
        switch viewModel.state {
        case .initial, .loading:
            Text("Loading…")
                .onAppear {
                    interactor.loadApps()
                }
        case .done(let apps):
            list(apps)
        case .error:
            Text("⚠️")
        }
    }

    @ViewBuilder func list(_ apps: [Models.App]) -> some View {
        List {
            Section {
                ForEach(apps) { app in
                    HStack {
                        VStack(alignment: .leading) {
                            Button {
                                interactor.showApp(app)
                            } label: {
                                Text(app.name)
                                    .font(.headline)
                                    .bold()
                            }
                        }
                    }
                    .frame(minHeight: 60, alignment: .leading)
                }
                .onDelete { indexSet in
                    indexSet.first.map { interactor.deleteApp(apps[$0].uuid) }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}
