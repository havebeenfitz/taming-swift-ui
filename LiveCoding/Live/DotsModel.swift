import SwiftUI

class DotsModel: ObservableObject {
    
    @Published
    var state: State = .idle
    let dotsCount: Int = 3
}

extension DotsModel {
    
    enum State {
        case idle
        case loading
    }
}
