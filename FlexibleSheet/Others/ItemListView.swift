import SwiftUI

struct ItemListView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
                        List {
                            ForEach(vm.items, id: \.id) { item in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.name)
                                        .font(.title3)
                                        .padding(.top, 5)
                        
                        Text(item.description)
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.bottom, 5)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Items")
            .navigationBarItems(trailing: Button("Add") {
                vm.showAddSheet = true
            })
        }
        .flexiableSheet(isPresented: $vm.showAddSheet, content: {
            AddItemView(vm: vm)
        })
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(vm: ViewModel())
    }
}
