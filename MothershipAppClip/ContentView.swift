import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Mothership allows for easy install of your applications' development builds on test devices.")

                Spacer()

                Link(destination: URL(string: "itms-services://?action=download-manifest&url=https://neoneon.dev/install/stable-mothership/install.plist")!) {

                    HStack {
                        Text("Download")

                        Image(systemName: "arrow.down.circle")
                            .scaleEffect(1.3)
                    }
                }
            }
            .padding()
            .navigationTitle("Mothership")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
