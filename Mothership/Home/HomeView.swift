import Foundation
import SwiftUI

struct HomeView: View {

    private enum Content {
        case apps
    }

    @ObservedObject var viewModel: HomeViewModel
    var interactor: HomeInteractor?

    var body: some View {
        List([Content.apps], id: \.self) { presentationStyle in
            Button("apps") {
                interactor?.showApps()
            }
        }
        .navigationTitle(viewModel.title)
        .navigationBarItems(trailing: Button(action: {
            interactor?.showInfo()
        }, label: {
            Image(systemName: "info.circle.fill")
        }))
    }
}
