//
//  MothershipAppClipApp.swift
//  MothershipAppClip
//
//  Created by Martin Kim Dung-Pham on 01.08.21.
//

import SwiftUI

@main
struct MothershipAppClipApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { activity in
//                    print("\(activity.webpageURL)")
                }
        }
    }
}
