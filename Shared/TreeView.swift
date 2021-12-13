//
//  TreeView.swift
//  Algorithm Visualizer
//
//  Created by 孔维锐 on 2021/12/11.
//

import SwiftUI
struct TreeView: View {
    @Binding var majorView: MajorView
    @State var showTreeView = true
    @State var currentTreeType: TreeType = TreeType.BT;
    @State var showClearAlert = false //delete data without conformation
    @State var showSafeClearAlert = false
    @State var menuSelected : TreeType = TreeType.BT
    let treeType_arr = [TreeType.BT, TreeType.BST, TreeType.BBST]
    func getTreeName(treeType: TreeType) -> String {
        switch(treeType){
        case .BT:
            return "Binary Tree"
        case .BST:
            return "Bi Search Tree"
        case .BBST:
            return "Balanced BST"
        }
    }
    func getSelectedTreeName() -> String {
        return getTreeName(treeType: currentTreeType)
    }
    func setTreeType(treeType: TreeType){
        currentTreeType = treeType
    }
    func clearData() -> String {
        print("function not finished")
        return "function not finished"
    }
//    var treeName = {() -> String in
//        switch(selectedTreeType){
//        case .BT:
//            return "Binary Tree"
//        case .BST:
//            return "Binary Search Trees"
//        case .BBST:
//            return "Balanced BST"
//        }
//    }
    var body: some View {
        NavigationView {
            TabView{
                TreePanel()
                    .tabItem {
                        VStack{
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            Button(action: {}) {
                                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                            }
                        }
                    }
            }
            .navigationTitle(getSelectedTreeName())
              .toolbar {
                  ToolbarItem(placement: .navigationBarLeading) {
                      HStack{
                          //back
                          Button(action: {
                              withAnimation {
                                  majorView = .home
                                  showTreeView.toggle()
                              }
                          }) {
                              Label("Back", systemImage: "arrow.left.circle.fill")
                          }
                          //select trees
                          Menu("👉Mode👇") {
                              Button(getTreeName(treeType: .BT),action: {
                                  menuSelected = .BT
                                  showClearAlert.toggle()
                                  setTreeType(treeType: menuSelected)
                              })
                              Button(getTreeName(treeType: .BST),action: {
                                  menuSelected = .BST
                                  showClearAlert.toggle()
                                  setTreeType(treeType: menuSelected)
                              })
                              Button(getTreeName(treeType: .BBST),action: {
                                  menuSelected = .BBST
                                  showClearAlert.toggle()
                                  setTreeType(treeType: menuSelected)
                              })
                          }
                          .alert(isPresented: $showClearAlert) {
                              Alert(
                                  title: Text("Alert"),
                                  message: Text("Previous data removed"),
                                  dismissButton: .destructive(
                                      Text("Okay"),
                                      action: {
                                          print(clearData())
                                          setTreeType(treeType: menuSelected)
                                        //print(menuSelected)
                                      }
                                  )
                              )
                          }
                          Button(action: {
                              withAnimation {
                              }
                          }) {
                              Label("Select trees", systemImage: "leaf.circle.fill")
                          }
                      }
                  }
                  ToolbarItem(placement: .navigationBarTrailing) {
                      //reset
                      Button(action: {
                          showSafeClearAlert.toggle()
                      }) {
                          Label("Reset", systemImage: "leaf.arrow.triangle.circlepath")
                      }
                      .alert(isPresented: $showSafeClearAlert) {
                          Alert(
                              title: Text("Conformation"),
                              message: Text("This action will remove all registered data!"),
                              primaryButton: .default(
                                  Text("Nah")
                              ),
                              secondaryButton: .destructive(
                                  Text("Remove"),
                                  action: {
                                      print(clearData())
                                  }
                              )
                          )
                      }
                  }
              }
        }.scaleEffect(showTreeView ? 1 : 0)
            
    }
}

struct TreePanel : View{
    var body : some View{
        Text("TreePanel")
    }
}


//struct TreeView_Previews: PreviewProvider {
//    static var previews: some View {
//        TreeView()
//    }
//}
