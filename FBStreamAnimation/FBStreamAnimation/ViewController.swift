

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let image = UIImage(named: "feedBack")
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
       
        
        let animation = CAKeyframeAnimation(keyPath: "position")
       
        
        animation.path = customPath().cgPath
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunctions = CAMediaTimingFunction(name: .easeInEaseOut)
        
        
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
    }
}
    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: 200))
        
        let endPoint = CGPoint(x: 400, y: 200)
        
        let cp1 = CGPoint(x: 100, y: 100)
        let cp2 = CGPoint(x: 200, y: 300)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
    
    class CurvedView: UIView {
        override func draw(_ rect: CGRect){
            
            let path = customPath()
            
            path.lineWidth = 3
            path.stroke()
        }
    }
    

