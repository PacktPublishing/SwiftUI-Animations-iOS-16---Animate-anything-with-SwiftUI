
import SwiftUI

struct SnowView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        //configure the screen
        let screen = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height))
        view.layer.masksToBounds = true
        
        //configure the emitter
        let emitter = CAEmitterLayer()
        emitter.frame = CGRect(x: 200, y: -100, width: view.frame.width, height: view.frame.height)
        
        //configure the cell
        let cell = CAEmitterCell()
        cell.birthRate = 40
        cell.lifetime = 25
        cell.velocity = 60
        cell.scale = 0.025
        cell.emissionRange = CGFloat.pi
        cell.contents = UIImage(named: "snow")?.cgImage
        
        emitter.emitterCells = [cell]
        view.layer.addSublayer(emitter)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView()
            .background(Color.black)
    }
}
