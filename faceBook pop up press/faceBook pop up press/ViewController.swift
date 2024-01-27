

import UIKit

class ViewController: UIViewController {
    
    
    let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "screen")
        return imageView
    }()

    let iconsContainerView: UIView = {
        let conteinerView = UIView()
        conteinerView.backgroundColor = .white
        
//        let redView = UIView()
//        redView.backgroundColor = .red
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
//        let garayView = UIView()
//        garayView.backgroundColor = .gray
//
//        let arraySabViews = [redView, blueView, yellowView, garayView]
//
//
       let arraySabViews = [UIColor.red, .blue].map({(color) -> UIView in
            let v = UIView()
            v.backgroundColor = color
            return v
        })
        
        let stackView = UIStackView(arrangedSubviews: arraySabViews)
        stackView.distribution = .fillEqually
        
        
        //configuration actions
        let iconHeight: CGFloat = 50
        let padding: CGFloat = 8
        
        stackView.spacing = padding
        stackView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        conteinerView.addSubview(stackView)
        
        let numIcons = CGFloat(arraySabViews.count)
        let width = numIcons * iconHeight + (numIcons + 1) * padding
        
        conteinerView.frame = CGRect(x: 0, y: 0, width: 200, height: iconHeight + 2 * padding)
        stackView.frame = conteinerView.frame
        
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

