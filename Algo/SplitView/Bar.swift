import SwiftUI
import Foundation

struct Bar: View, Hashable {
    var value: CGFloat
    var selected: Bool
    var moving: Bool = false
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .bottom) {
                Capsule().frame(width: BarWidth, height: BarMaxHeight)
                    //.foregroundColor(Color(#colorLiteral(red: 0, green: 0.8890399337, blue: 0.7886388898, alpha: 1)))
                    .foregroundColor(.white.opacity(0))
                    .scaleEffect(moving ? 1.05 : 1)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.2))
                Capsule().frame(width: BarWidth * (moving ? 1.1 : 1), height: value)
                    .foregroundColor(selected
                                     ?Color(#colorLiteral(red: 0.9568627477,
                                                          green: 0.6588235497,
                                                          blue: 0.5450980663,
                                                          alpha: 1))
                                        .opacity(moving ? 0.8 : 0.3)
                                     : .blue.opacity(0.2))
                    //.shadow(color: .gray, radius: moving ? 4 : 0, x: moving ? 5 : 0, y: moving ? 5 : 0)
                    .scaleEffect(moving ? 1.05 : 1)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.2))
                
                    //.foregroundColor(selected ? .black : .red)
            }.padding(.top, 40)
                //.scaleEffect(moving ? 1.1 : 1)
                //.shadow(color: Color.gray, radius: moving ? 3 : 0,x: moving ? 3 : 0, y: moving ? 3 : 0)
            Text(String(format:"%d", Int(value/20)))
                .scaleEffect(moving ? 1.05 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.55, blendDuration: 0.25))
        }.animation(.easeInOut)
        
        
    }
}

