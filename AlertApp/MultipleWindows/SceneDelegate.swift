import SwiftUI

final class AppSceneDelegate: UIResponder, UIWindowSceneDelegate, ObservableObject {
    
    var windowScene: UIWindowScene?
    
    private var windows: [UIWindow] = []
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        windowScene = scene as? UIWindowScene
    }
    
    func addNewWindow(level: UIWindow.Level, content: () -> some View) {
        let viewController = UIHostingController(rootView: content())
        viewController.view.backgroundColor = .clear
        
        guard let newWindow = newWindow(with: level, attachRoot: viewController) else {
            return
        }
        
        windows.append(newWindow)
    }
    
    private func newWindow(
        with level: UIWindow.Level,
        attachRoot controller: UIViewController
    ) -> PassThroughWindow? {
        guard let windowScene else { return nil }
        
        let window = PassThroughWindow(windowScene: windowScene)
        window.windowLevel = level
        window.rootViewController = controller
        window.isHidden = false
        
        return window
    }
}
