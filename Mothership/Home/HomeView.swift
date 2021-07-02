import Foundation
import SwiftUI

struct HomeView: View {
    let interactor: HomeInteractor

    var body: some View {
        Button("apps") {
            interactor.next()
        }
        .navigationTitle("Home")
        .navigationBarItems(trailing: Image(systemName: "app.dashed"))
    }
}
