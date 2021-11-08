import Foundation
import SwiftUI

/// The style a coordinator should be presented in when transitioning to it.
public enum PresentationStyle {
    case push
    case present(modalInPresentation: Bool)
    case fullscreenModal
    case replace
}

public protocol Coordinator: AnyObject {
    associatedtype ViewType: View

    var contentView: ViewType { get }
    var router: Router? { get set }
}

extension Coordinator {
    public var view: some View {
        contentView
            .coordinated(coordinator: self)
    }
}

extension Coordinator {

    public func transition<C: Coordinator>(_ presentationStyle: PresentationStyle, to child: C) {

        child.router = Router(parent: router)

        switch presentationStyle {
        case .push:
            router?.navigationLinkDestination = AnyView(child.view)
            router?.isNavigationLinkActive = true
        case .present(let isModalInPresentation):
            router?.sheet = AnyView(child.view.containInNavigation)
            router?.showingSheet = true
            break
        case .fullscreenModal:
            router?.fullscreenModal = AnyView(child.view.containInNavigation)
            router?.showingFullscreenModal = true
            break
        case .replace:
            break
        }
    }

    public func dismiss() {
        var parent: Router? = router?.parent
        //        while parent?.parent != nil {
        //            parent = parent?.parent
        //        }
        parent?.showingSheet = false
        parent?.showingFullscreenModal = false
    }
    
    public func pop() {
        router?.isNavigationLinkActive = false
    }
}
