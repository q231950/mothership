import SwiftUI

struct InfoView: View {

    var viewModel: InfoViewModel

    var body: some View {
        VStack {
            Text("Mothership allows for easy install of your applications' development builds on test devices.")

            Spacer()

            Button {
                viewModel.installNewestMothershipApp()
            } label: {
                HStack {
                    Text("Latest Stable Mothership")

                    Image(systemName: "arrow.down.circle")
                        .scaleEffect(1.1)
                }
            }

        }
        .padding()
        .navigationTitle("Info")
        .navigationBarItems(trailing:
                                Button(action: {
            viewModel.dismiss()
        }) {
            Image(systemName: "xmark")
                .scaleEffect(1.1)
        })
    }
}
