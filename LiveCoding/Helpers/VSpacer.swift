import SwiftUI

struct VSpacer: View {
    
    let height: CGFloat
    
    init(_ height: CGFloat) {
        self.height = height
    }
    
    var body: some View {
        Spacer().frame(height: height)
    }
}
