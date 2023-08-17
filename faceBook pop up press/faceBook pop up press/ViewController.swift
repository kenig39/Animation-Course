

import UIKit

class ViewController: UIViewController {
    
    
    let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "screen")
        return imageView
    }()

    let iconsContainerView: UIView = {
        let conteinerView = UIView()
        conteinerView.backgroundColor = .red
        
        conteinerView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        return conteinerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgImageView)
        bgImageView.frame = view.frame
        
        
        setUpLongPressGesture()
            
        
    }

    
    fileprivate func setUpLongPressGesture(){
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress)))
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer){
        
        if gesture.state == .began {
           handleGestureBegan(gesture: gesture)
            
        } else if gesture.state == .ended {
            iconsContainerView.removeFromSuperview()
            
        }
    }
    
    
    fileprivate func handleGestureBegan(gesture: UILongPressGestureRecognizer){
        view.addSubview(iconsContainerView)
        let pressLocation = gesture.location(in: self.view)
        print(pressLocation)
        
        //transformation of the red box
        let centredX = (view.frame.width - iconsContainerView.frame.width) / 2
        
       
        // alpha
        iconsContainerView.alpha = 0
        self.iconsContainerView.transform = CGAffineTransform(translationX: centredX, y: pressLocation.y )
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: {
            self.iconsContainerView.alpha = 1
            self.iconsContainerView.transform = CGAffineTransform(translationX: centredX, y: pressLocation.y - self.iconsContainerView.frame.height)
            
        })
    }
    
    override var prefersStatusBarHidden: Bool{return true}

}

