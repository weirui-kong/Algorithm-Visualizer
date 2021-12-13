//
//  HomeView.swift
//  Algorithm Visualizer
//
//  Created by 孔维锐 on 2021/12/11.
//

import SwiftUI
let finger = ["👇","👇🏻","👇🏼","👇🏽","👇🏾","👇🏿"]
struct HomeView: View {
    @Binding var majorView: MajorView//主要视图
    @State var angle: Double = 0 //图像视图的旋转角度
    @State var scale: Double = 1
    @State var signAni = true
    var animation: Animation {
        Animation.spring(response: 0.7) //设置动画的时间曲线为弹性样式
            //.repeatForever() //设置动画的播放为无限循环模式
            .repeatForever(autoreverses: signAni) //使动画来回反弹
            
       }
    
    var body: some View {
        VStack{
            Spacer()
            Image("icon")

            Text("Eine Funktion")
                .font(.system(size: 40))
            Text("Wählen")
                .font(.system(size: 50))

            Text("\n")
            if(signAni){
                HStack{
                    ForEach(finger.indices , id: \.self){ i in
                                    Text(finger[i])
                            .rotationEffect(.degrees(-45))
                            .font(.system(size: 30))
                            .rotationEffect(Angle.init(degrees: angle)) //按照属性的大小，对图像视图进行旋转操作
                            .scaleEffect(scale)
                            .animation(animation)
                            .onAppear(perform: {
                                angle += 90 - 15 + 601
                                scale += 0.4 / 6.0
                                })}
                    }
            }
            Text("\n")
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        majorView = MajorView.tree
                        signAni = false
                    }
                    
                }) {
                    Text("Bäume\nVisualisierung")
                        .font(.system(size: 20))
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        majorView = MajorView.sort
                        signAni = false
                    }
                }) {
                    Text("Staffelung\nVisualisierung")
                        .font(.system(size: 20))
                }
                Spacer()
            }
            Spacer()

        }
        .animation(.easeInOut)
    }

}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
