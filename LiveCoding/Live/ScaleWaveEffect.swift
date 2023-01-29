import SwiftUI

struct ScaleWaveEffect: GeometryEffect {
    
    var animatableData: CGFloat {
        get { trigger.animatableData }
        set { trigger.animatableData = newValue }
    }
    
    var trigger: Trigger
    var index: Int
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let scale = scale(x: trigger.animatableData, index: index)
        
        return ProjectionTransform(
            CGAffineTransform(scaleX: scale, y: scale)
                .translatedBy(x: -8, y: -8)
        )
    }
    
    func scale(x: CGFloat, index: Int) -> CGFloat {
        let slope = 0.5
        let xOffset = 1.0 - CGFloat(index)
        let yOffset = 1.5
        
        let y = -slope * abs(x - xOffset) + yOffset
        return max(1, y)
    }
}

extension ScaleWaveEffect {
    
    struct Trigger {
        
        var animatableData: CGFloat = 2.0
        
        mutating func start() {
            animatableData = animatableData == 2.0 ? -2.0 : 2.0
        }
        
        mutating func stop() {
            animatableData = 2.0
        }
    }
}

extension View {
    
    func scaleWave(index: Int, trigger: ScaleWaveEffect.Trigger) -> some View {
        modifier(ScaleWaveEffect(trigger: trigger, index: index))
            .offset(x: 8, y: 8)
    }
}
