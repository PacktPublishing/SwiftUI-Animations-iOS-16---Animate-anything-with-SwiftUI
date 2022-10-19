import SwiftUI

struct ContentView: View {
    
    @State private var petal = false
    @State private var breathInLabel = true
    @State private var breathOutLabel = false
    @State private var offsetBreath = false
    @State private var diffuseBreath = false
    @State private var breathTheBouquet = false
    
    var body: some View {
        ZStack {
           //MARK: - WINTER BACKGROUND
            Image("winterNight").resizable().aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 900)
            SnowView()
            ZStack {
                //MARK: - ANIMATE TEXT LABELS
                Group {
                    Text("Breath In")
                        .font(Font.custom("papyrus", size: 35))
                        .foregroundColor(Color(UIColor.green))
                        .opacity(breathInLabel ? 0 : 1)
                        .scaleEffect(breathInLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathInLabel)
                    
                    Text("Breath Out")
                        .font(Font.custom("papyrus", size: 35))
                        .foregroundColor(Color(UIColor.orange))
                        .opacity(breathOutLabel ? 0 : 1)
                        .scaleEffect(breathOutLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathOutLabel)
                }
                
                //MARK: - CONVERT A STILL IMAGE INTO ANIMATED SMOKE (BREATH)
                Group {
                    Image("smoke").resizable().frame(width: 35, height: 125)
                        .offset(y: offsetBreath ? 90 : 0)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: offsetBreath)
                        .blur(radius: diffuseBreath ? 1 : 60)
                        .offset(x: 0, y: diffuseBreath ? -50: -100)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: diffuseBreath)
                }.shadow(radius: diffuseBreath ? 20 : 0)
                
                //MARK: - ANIMATE THE PETALS
                Group {
                    ///one left of the middle
                    PetalView(petal: $petal, degrees: petal ? -25 : -5)
                    ///middle petal
                    Image("petal").resizable().frame(width: 75, height: 125)
                    ///one right of the middle
                    PetalView(petal: $petal, degrees: petal ? 25 : 5)
                    ///two left from the middle
                    PetalView(petal: $petal, degrees: petal ? -50 : -10)
                    ///two right from the middle
                    PetalView(petal: $petal, degrees: petal ? 50 : 10)
                }
                
                //MARK: - THE BOUQUET - MAKE IT BREATH TOO
                Group {
                    Image("bouquet").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(37))
                        .offset(x: -25, y: 90)
                        .scaleEffect(breathTheBouquet ? 1.04 : 1, anchor: .center)
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathTheBouquet)
                    
                    Image("bouquet").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(32))
                        .offset(x: -20, y: 95)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .scaleEffect(breathTheBouquet ? 1.02 : 1, anchor: .center)
                        .hueRotation(Angle(degrees: breathTheBouquet ? -50 : 300))
                        .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathTheBouquet)
                }
                
            }
        }.onAppear() {
            breathInLabel.toggle()
            breathOutLabel.toggle()
            offsetBreath.toggle()
            diffuseBreath.toggle()
            petal.toggle()
            breathTheBouquet.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
