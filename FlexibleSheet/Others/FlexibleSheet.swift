import SwiftUI

struct FlexibleSheet<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    @ViewBuilder let sheetContent: () -> SheetContent
    private let startColor = Color(red: 0.8, green: 0.8, blue: 0.8)
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                VStack {
                    Spacer()
                    VStack {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.gray)
                            .frame(width: 50, height: 4, alignment: .center)
                            .padding(10)
                            .padding(.bottom, 10)
                            .onTapGesture {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                        
                        sheetContent()
                            .padding(.bottom, 30)
                    }
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(colors: [startColor, .white], startPoint: .top, endPoint: .bottom))
                    .cornerRadius(15)
                }
            }
        }
        .animation(.default, value: isPresented)
        .ignoresSafeArea()
    }
}

extension View {
    func flexiableSheet<Content: View>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View {
        modifier(FlexibleSheet(isPresented: isPresented, sheetContent: content))
    }
}
