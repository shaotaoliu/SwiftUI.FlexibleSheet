import SwiftUI

struct TestView: View {
    @State var showSheet = false
    
    var body: some View {
        ViewWithSheet(isPresented: $showSheet, mainContent: {
            Button("Show Sheet") {
                showSheet = true
            }
        }, sheetContent: {
            Text("This is a sheet")
        })
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
