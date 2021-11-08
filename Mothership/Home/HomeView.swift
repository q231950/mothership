import Foundation
import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        List([Content.apps, Content.tags], id: \.self) { content in
            Group {
                if content == .apps {
                    Button("Apps") {
                        viewModel.showApps()
                    }
                }
            }
            .frame(minHeight: 60, alignment: .leading)
        }
        .navigationTitle(viewModel.title)
        .navigationBarItems(trailing: Button(action: {
            viewModel.showInfo()
        }, label: {
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: 26, height: 26)
                .scaledToFit()
        }))
    }
}

private extension HomeView {
    enum Content {
        case apps
        case tags
    }
}
