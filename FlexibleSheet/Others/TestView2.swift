import SwiftUI

struct TestView2: View {
    @State var showSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showSheet = true
        }
        .flexiableSheet(isPresented: $showSheet) {
            Text("This is a sheet")
        }
    }
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
