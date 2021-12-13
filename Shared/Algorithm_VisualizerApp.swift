//
//  Algorithm_VisualizerApp.swift
//  Shared
//
//  Created by 孔维锐 on 2021/12/11.
//

import SwiftUI
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.move(edge: .trailing)
    }
    static var moveAndFadeLeading: AnyTransition {
        AnyTransition.move(edge: .leading)
    }
    static var moveAndFadeUp: AnyTransition {
        AnyTransition.move(edge: .top)
    }
    static var moveAndFadeBottom: AnyTransition {
        AnyTransition.move(edge: .bottom)
    }
}
@main
struct Algorithm_VisualizerApp: App {
    @State var majorView = MajorView.home
    @State var loaded = true
    var body: some Scene {
        WindowGroup {
            if (loaded){
                switch majorView {
                case MajorView.home:
                    HomeView(majorView: $majorView, signAni: true)
                        .transition(.moveAndFade)
                case MajorView.tree:
                    TreeView(majorView: $majorView, showTreeView: true)
                        .transition(.moveAndFade)
                case MajorView.sort:
                    SortView(majorView: $majorView, showSortView: true)
                        .transition(.moveAndFade)
                }
            }else{
                
            }
        }
    }
}
