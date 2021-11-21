import SwiftUI

struct AddValueSheet: View {
    @Binding var value: String
    @Binding var showAddSheet: Bool
    @State private var editValue = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 25) {
                HStack {
                    TextField("Enter", text: $editValue)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        editValue = ""
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.title2)
                            .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                    })
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack(spacing: 30) {
                    Button("Save") {
                        value = editValue
                        showAddSheet = false
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 35)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Button("Cancel") {
                        showAddSheet = false
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 35)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .padding(.bottom, 25)
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [.gray, .white], startPoint: .top, endPoint: .bottom))
            .cornerRadius(10)
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            editValue = value
        })
        .animation(.spring(), value: showAddSheet)
    }
}

struct AddValueSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            AddValueSheet(value: .constant(""), showAddSheet: .constant(true))
        }
    }
}
