import SwiftUI

struct FilledButton: View {

    let title: String
    var action: (() -> Void)
    
    init(_ title: String, action: @escaping (() -> Void)) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text(title).foregroundColor(.black)
                Spacer()
            }
            .frame(height: 60)
        }
        .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .buttonStyle(.automatic)
        .padding(.horizontal, 20)
        .accentColor(.green)
    }
}
