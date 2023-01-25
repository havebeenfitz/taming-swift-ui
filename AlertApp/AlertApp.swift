import SwiftUI

@main
struct AlertApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State var isShowingAlert = false
    @State var isShowingSheet = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                buttons

                WindowView(level: .alert + 1) {
                    Group {
                        Color.clear
                    }
                    .notification($isShowingAlert)
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                Text("Not covering alert")
            }
        }
    }
    
    var buttons: some View {
        VStack {
            Button("Show Notification") {
                withAnimation {
                    isShowingAlert = true
                }
            }
            
            Button("Show Sheet") {
                withAnimation {
                    isShowingSheet = true
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct Notification: View {
    
    var body: some View {
        Text("Notification")
            .padding(20)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(30)
            .padding(30)
    }
}

struct NotificationModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                if isPresented {
                    Notification()
                        .transition(.move(edge: .top))
                        .onTapGesture {
                            withAnimation {
                                isPresented = false
                            }
                        }
                }
            }
    }
}

extension View {
    
    func notification(_ isPresented: Binding<Bool>) -> some View {
        modifier(NotificationModifier(isPresented: isPresented))
    }
}
