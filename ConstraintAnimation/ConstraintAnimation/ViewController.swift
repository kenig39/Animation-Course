
import UIKit

class ViewController: UIViewController {

    
       let justSimpleFoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "feedback")
        //this  enables autolayout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer( UITapGestureRecognizer(target: self , action: #selector(handelAnimate)))
        return imageView
    }()
    
    
    @objc func handelAnimate() {
        
        leftAnchor?.isActive = false
        rightAnchor?.isActive = false
        bottonAnchor?.isActive = true
        rightAnchor?.isActive = true
        
//        weightAnchor?.constant = 200
//        heightAnchor?.constant = 200
//
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: {
            
            self.view.layoutIfNeeded()
        })
       
    }
    
    var leftAnchor: NSLayoutConstraint?
    var rightAnchor: NSLayoutConstraint?
    var topAnchor: NSLayoutConstraint?
    var bottonAnchor: NSLayoutConstraint?
    
    var weightAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(justSimpleFoto)
        
        topAnchor = justSimpleFoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        topAnchor?.isActive = true
        
        leftAnchor = justSimpleFoto.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        leftAnchor?.isActive = true
        
        rightAnchor = justSimpleFoto.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        
        bottonAnchor = justSimpleFoto.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        weightAnchor =  justSimpleFoto.widthAnchor.constraint(equalToConstant: 100)
       weightAnchor?.isActive = true
        
        heightAnchor = justSimpleFoto.heightAnchor.constraint(equalToConstant: 100)
        heightAnchor?.isActive = true
        
    }


}

