import Foundation
import SwiftUI

struct HomeView: View {

    private enum Content {
        case apps
    }

    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        List([Content.apps], id: \.self) { presentationStyle in
            Button("apps") {
                viewModel.showApps()
            }
        }
        .navigationTitle(viewModel.title)
        .navigationBarItems(trailing: Button(action: {
            viewModel.showInfo()
        }, label: {
            Image(systemName: "info.circle.fill")
                .scaleEffect(1.1)
        }))
    }
}
