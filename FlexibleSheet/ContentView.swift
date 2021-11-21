import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ViewWithSheet(isPresented: $vm.showAddSheet, mainContent: {
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
        }, sheetContent: {
            AddItemView(vm: vm)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ViewModel())
    }
}
