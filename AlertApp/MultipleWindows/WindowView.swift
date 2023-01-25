import SwiftUI

struct WindowView<Subview: View>: View {
    
    @EnvironmentObject var sceneDelegate: AppSceneDelegate
        
    let level: UIWindow.Level
    let content: () -> Subview
    
    var body: some View {
        Color.clear
            .onAppear {
                sceneDelegate.addNewWindow(level: level) { content() }
            }
    }
}

