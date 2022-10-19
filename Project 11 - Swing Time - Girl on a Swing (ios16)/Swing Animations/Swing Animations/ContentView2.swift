
import SwiftUI

struct ContentView: View {
    
    @State private var girl = false
    @State private var leftLeg = false
    @State private var rightLeg = false
    let fadeOutRope = Gradient(colors: [.clear, .black])
    
    var body: some View {
        ZStack {
            Image("tree").resizable()
                .frame(width: 550, height: 900)
            ZStack {
                //MARK: - LEGS
                ///left leg
                Image("leg").resizable().aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(leftLeg ? -45 : 30), anchor: .topTrailing)
                    .scaleEffect(0.12)
                    .offset(x: -455, y: 90)
                    .animation(Animation.easeInOut(duration: 0.4).delay(1).repeatForever(autoreverses: true), value: leftLeg)
                    .onAppear() {
                        leftLeg.toggle()
                    }.zIndex(1)
                
                ///right leg
                Image("leg").resizable().aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(rightLeg ? -20 : 50), anchor: .topTrailing)
                    .scaleEffect(0.12)
                    .offset(x: -448, y: 92)
                    .animation(Animation.easeInOut(duration: 1).delay(0.09).repeatForever(autoreverses: true), value: rightLeg)
                    .onAppear() {
                        rightLeg.toggle()
                    }
                
                //MARK: - GIRL
                Image("Girl").resizable().aspectRatio(contentMode: .fit)
                    .scaleEffect(0.25)
                    .offset(x: -300, y: 0)
                
                //MARK: - ROPE
                ///right side rope
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeOutRope, startPoint: .top, endPoint: .bottom))
                    .frame(width: 57, height: 80)
                    .offset(x: -189, y: -100)
                
                ///left side rope
                Image("rope").resizable().aspectRatio(contentMode: .fit)
                    .mask(LinearGradient(gradient: fadeOutRope, startPoint: .top, endPoint: .bottom))
                    .frame(width: 57, height: 80)
                    .offset(x: -228, y: -108)
                
                
                
                
            }.rotationEffect(.degrees(girl ? -30 : -45), anchor: .top)
                .animation(Animation.easeInOut(duration: 1).delay(0.09).repeatForever(autoreverses: true), value: girl)
                .onAppear() {
                    girl.toggle()
                }
            
            Image("leaves").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 400, height: 400)
                .rotationEffect(.degrees(-15),anchor: .trailing)
                .offset(x: -10, y: -180)
            
            
            
        }.frame(width: 950, height: 900)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
