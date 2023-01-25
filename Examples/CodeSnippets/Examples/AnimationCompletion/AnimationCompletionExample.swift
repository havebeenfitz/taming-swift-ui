import SwiftUI

struct AnimationCompletionExampleView: View {
    
    @State var opacity = 0.0
    @State var offset: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Example")
                .offset(offset)
                .onAnimationCompleted(for: opacity) {
                    withAnimation(.default.speed(0.1)) {
                        offset = .init(width: 50, height: 50)
                    }
                }
        }
        .opacity(opacity)
        .onAppear {
            withAnimation(.default.speed(0.3)) {
                opacity = 1.0
            }
        }
    }
}

struct AnimationCompletion_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCompletionExampleView()
    }
}
