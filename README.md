# SwiftUI.FlexibleSheet

In iOS apps, you can use the .sheet modifier to create a sheet. A sheet occupies the whole screen and the parent view is totally covered.

This app creates a ViewWithSheet which allows the user to create a flexible sheet. It is shown at the bottom of the screen and only occupies the space that it needs.

```Swift
struct ViewWithSheet<MainContent: View, SheetContent: View>: View
```

The following shows the constructor that creates a ViewWithSheet.

```Swift
init(isPresented: Binding<Bool>, mainContent: () -> MainContent, sheetContent: () -> SheetContent)
```
* `isPresented` 
A binding to a Boolean value that determines whether to present the sheet.

* `mainContent` 
A closure that returns the content of the main screen.

* `sheetContent` 
A closure that returns the content of the sheet.

Example:
```Swift
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
```

The following shows the sheet.

![image](https://user-images.githubusercontent.com/15805568/142751710-854587dd-39ff-4ea8-b72e-41f6a4bdc95f.png)

Tapping the gray bar on the top of the sheet will close the sheet.

The following shows the main screen of this app.

![image](https://user-images.githubusercontent.com/15805568/142751749-5a06f4f4-b81a-4121-8557-7d0378ba0e4f.png)


