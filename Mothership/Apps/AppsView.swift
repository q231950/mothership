import Foundation
import SwiftUI
import ArchitectureX

struct AppsView: View {

    @ObservedObject var viewModel: AppsViewModel
    let interactor: AppsInteractor

    var body: some View {
        List {
            Section {
                ForEach(viewModel.apps) { app in
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
                    indexSet.first.map { interactor.deleteApp(viewModel.apps[$0].uuid) }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Apps")
    }
}
