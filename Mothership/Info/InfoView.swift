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
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFit()
                }
            }

        }
        .padding()
        .navigationTitle("Info")
        .navigationBarItems(trailing:
                                Button(action: {
            viewModel.dismiss()
        }) {
            HStack {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
            }
        })
    }
}
