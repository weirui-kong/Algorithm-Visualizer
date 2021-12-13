import SwiftUI
import Foundation

struct Bar: View, Hashable {
    var value: CGFloat
    var selected: Bool
    //var moving = false
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .bottom) {
                Capsule().frame(width: BarWidth, height: BarMaxHeight)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.8890399337, blue: 0.7886388898, alpha: 1)))
                Capsule().frame(width: BarWidth, height: value)
                    .foregroundColor(selected ? Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)) : .white)
            }.padding(.top, 40)
                //.scaleEffect(moving ? 1.1 : 1)
                //.shadow(color: Color.gray, radius: moving ? 3 : 0,x: moving ? 3 : 0, y: moving ? 3 : 0)
            Text(String(format:"%d", Int(value/20)))
                .foregroundColor(Color.black)
        }
        
        
    }
}

