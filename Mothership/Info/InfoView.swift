import SwiftUI

struct InfoView: View {

    var interactor: InfoInteractor?

    var body: some View {
        Text("Info")
            .padding()
            .navigationTitle("Info")
            .navigationBarItems(trailing:
                                    Button(action: {
                    interactor?.dismiss()
            }) {
                Image(systemName: "xmark")
            })
    }
}
