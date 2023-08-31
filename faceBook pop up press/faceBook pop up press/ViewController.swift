

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
        
        
        //configuration actions
        let iconHeight: CGFloat = 30
        let padding: CGFloat = 6
        
        
        let images = [UIImage(named: "like"), UIImage(named: "feedback")]
//
        let arrayImages = images.map ({ (image) -> UIView in
            let imageView = UIImageView(image: image)
            imageView.layer.cornerRadius = iconHeight / 2
            
                // required for hit testing
            
            imageView.isUserInteractionEnabled = true
            return imageView
            
        })
        
        
        
//        let arraySabViews = [UIColor.red, .blue, .yellow, .orange, .gray].map({(color) -> UIView in
//            let v = UIView()
//            v.backgroundColor = color
//           v.layer.cornerRadius = iconHeight / 2
//            return v
//        })
        
        let stackView = UIStackView(arrangedSubviews: arrayImages)
        stackView.distribution = .fillEqually
        
       
        stackView.spacing = padding
        stackView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        conteinerView.addSubview(stackView)
        
        let numIcons = CGFloat(arrayImages.count)
        let width = numIcons * iconHeight + (numIcons + 1) * padding
        
        conteinerView.frame = CGRect(x: 0, y: 0, width: 200, height: iconHeight + 2 * padding)
        
        conteinerView.layer.cornerRadius = conteinerView.frame.height / 2
        
        // shadow
        
        conteinerView.layer.shadowColor = UIColor(white: 0.4, alpha: 0.4).cgColor
        conteinerView.layer.shadowRadius = 8
        conteinerView.layer.shadowOpacity = 0.5
        conteinerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        
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
            //clean up the animation
            UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: {
                let stackView = self.iconsContainerView.subviews.first
                stackView?.subviews.forEach({
                    (imageView) in
                    imageView.transform = .identity
                })
                
                self.iconsContainerView.transform =
                self.iconsContainerView.transform.translatedBy(x: 0, y: 50)
                self.iconsContainerView.alpha = 0
                
            }, completion: { (_) in
                    self.iconsContainerView.removeFromSuperview()
            })
            
        } else if gesture.state == .changed {
            handelGestureChanget(gesture: gesture)
        }
    }
    
    fileprivate func handelGestureChanget(gesture: UILongPressGestureRecognizer) {
        let pressedLocation = gesture.location(in: self.view)
        print(pressedLocation)
        
        let fixedYLocation = CGPoint(x: pressedLocation.x, y: self.iconsContainerView.frame.height / 2)
        
       let hitTestView = iconsContainerView.hitTest(pressedLocation, with: nil)
        if hitTestView is UIImageView{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: {
                
                let stackView = self.iconsContainerView.subviews.first
                stackView?.subviews.forEach({
                    (imageView) in
                    imageView.transform = .identity
                })
                
                hitTestView?.transform = CGAffineTransform(translationX: 0, y: -50)
            })
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

