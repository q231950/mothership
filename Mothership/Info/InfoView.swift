import SwiftUI

struct InfoView: View {

    var interactor: InfoInteractor

    var body: some View {
        VStack {
            Text("Mothership allows for easy install of your applications' development builds on test devices.")

            Spacer()

            Button {
                interactor.installNewestMothershipApp()
            } label: {
                HStack {
                    Text("Latest Stable Mothership")

                    Image(systemName: "arrow.down.circle")
                        .scaleEffect(1.3)
                }
            }

        }
        .padding()
        .navigationTitle("Info")
        .navigationBarItems(trailing:
                                Button(action: {
            interactor.dismiss()
        }) {
            Image(systemName: "xmark")
        })
    }
}
