import SwiftUI

struct MainView: View {
    @State var showAddSheet = false
    @State var value = ""
    
    var body: some View {
        ZStack {
            HStack {
                TextField("Value", text: $value)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add") {
                    showAddSheet = true
                }
                .foregroundColor(.white)
                .frame(width: 80, height: 35)
                .background(Color.green)
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.blue)
            
            if showAddSheet {
                AddValueSheet(value: $value, showAddSheet: $showAddSheet)
            }
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
