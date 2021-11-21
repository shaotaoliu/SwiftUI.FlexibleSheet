import SwiftUI

struct ViewWithSheet<MainContent: View, SheetContent: View>: View {
    @ViewBuilder let mainContent: MainContent
    @ViewBuilder let sheetContent: SheetContent
    @Binding var isPresented: Bool
    private let startColor = Color(red: 0.8, green: 0.8, blue: 0.8)
    
    init(isPresented: Binding<Bool>,
         mainContent: () -> MainContent,
         sheetContent: () -> SheetContent)
    {
        self._isPresented = isPresented
        self.mainContent = mainContent()
        self.sheetContent = sheetContent()
    }
    
    var body: some View {
        ZStack {
            mainContent
            
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
                                isPresented = false
                            }
                        
                        sheetContent
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

struct ViewWithSheet_Previews: PreviewProvider {
    static var previews: some View {
        ViewWithSheet(isPresented: .constant(true), mainContent: {
            Color.blue
        }, sheetContent: {
            Text("Sheet Content")
        })
    }
}
