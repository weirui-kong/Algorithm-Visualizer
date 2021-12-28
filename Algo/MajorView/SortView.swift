//
//  SortView.swift
//  Algorithm Visualizer
//
//  Created by 孔维锐 on 2021/12/11.
//

import SwiftUI


let BarWidth: CGFloat = 20
let BarMaxHeight: CGFloat = 200
let BarUnit: CGFloat = 20
let BarColor_Default: Color = .white
let BarColr_Selected: Color = .purple

var timer: Timer?

var cockTailShaker: Bool = false // this allows to visualize 'cocktail shaker' which takes turns on each end

struct SortView: View{
    @Binding var majorView: MajorView
    @State var showSortView = true
    @State var seletedTab: Int = 0
    
    var body: some View{
        ZStack{
            NavigationView{
                TabView(selection: $seletedTab){
                    SortPanelView()
                        .tabItem{
                            VStack{
                                Image(systemName: "rectangle.3.group.bubble.left")
                                Button(getLocalizedTextCapitalized(key: "sort"), action: {})
                            }
                        }
                        .tag(0)
                    
                    //                    DataCollectView()
                    //                        .tabItem{
                    //                            VStack{
                    //                                Image(systemName: "list.number")
                    //                                Button("Daten", action: {})
                    //                            }
                    //                        }
                    ScrollView{
                        SortInfoView()
                    }
                        .tabItem{
                            VStack{
                                Image(systemName: "doc.fill")
                                Button(getLocalizedTextCapitalized(key: "information"), action: {})
                            }
                        }
                        .tag(1)
                }
                .navigationBarTitle(getLocalizedTextCapitalized(key: "sort"), displayMode: .automatic)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack{
                            Button(action: {
                                withAnimation {
                                    majorView = .home
                                    showSortView.toggle()
                                }
                            }) {
                                Label("Back", systemImage: "arrow.left.circle.fill")
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack{
                            Button(action: {
                                withAnimation {
                                    majorView = .home
                                    showSortView.toggle()
                                }
                            }) {
                                Label("Info", systemImage: "info.circle.fill")
                            }
                        }
                    }
                }
            }
            
        }
        .scaleEffect(showSortView ? 1 : 0)
        .animation(.easeInOut)
        
    }
}



