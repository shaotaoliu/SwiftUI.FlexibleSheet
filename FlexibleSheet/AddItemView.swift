import SwiftUI

struct AddItemView: View {
    @ObservedObject var vm: ViewModel
    @State private var item = Item()
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("Name", text: $item.name)
                .textFieldStyle(.roundedBorder)
            
            TextField("Description", text: $item.description)
                .textFieldStyle(.roundedBorder)
            
            Button("Save") {
                vm.add(item: item)
                vm.showAddSheet = false
            }
            .padding(.top, 10)
        }
        .padding()
        .onChange(of: vm.showAddSheet, perform: { show in
            if !show {
                item.name = ""
                item.description = ""
            }
        })
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(vm: ViewModel())
    }
}
