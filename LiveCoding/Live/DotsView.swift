import SwiftUI

struct DotsView: View {
    
    @ObservedObject var model: DotsModel
    @State var trigger = ScaleWaveEffect.Trigger()
    
    var body: some View {
        ZStack {
            backdrop
            dotsView
        }
        .onChange(of: model.state) { newValue in
            switch newValue {
            case .idle:
                trigger.stop()
            case .loading:
                withAnimation(.linear.speed(0.3).repeatForever(autoreverses: false)) {
                    trigger.start()
                }
            }
        }
    }
    
    var backdrop: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.gray.opacity(0.5))
            .frame(width: 150, height: 150)
    }
    
    var dotsView: some View {
        HStack(spacing: 20) {
            ForEach(0 ..< model.dotsCount, id: \.self) { index in
                dotView(index: index)
            }
        }
    }
    
    func dotView(index: Int) -> some View {
        Circle()
            .foregroundColor(.white)
            .frame(width: 16)
            .scaleWave(index: index, trigger: trigger)
    }
}
