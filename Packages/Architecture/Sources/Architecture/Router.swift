import Foundation
import SwiftUI

public class Router: ObservableObject {
    public unowned var parent: Router?

    @Published public var showingSheet = false
    public var sheet: AnyView = AnyView(EmptyView())

    @Published public var showingFullscreenModal = false
    public var fullscreenModal: AnyView = AnyView(EmptyView())

    @Published public var isNavigationLinkActive = false
    var navigationLinkDestination: AnyView = AnyView(EmptyView())

    public init(parent: Router? = nil) {
        self.parent = parent
    }
}
