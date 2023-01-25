import SwiftUI

struct MainView: View {
    
    @StateObject var dotsModel = DotsModel()
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                VSpacer(150)
                // TODO:
                VSpacer(150)
                FilledButton("Start") {
                    dotsModel.state = .loading
                }
                FilledButton("Stop") {
                    dotsModel.state = .idle
                }
            }
        }
        .padding(40)
        .background(Color.white)
    }
}

struct LoaderPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
