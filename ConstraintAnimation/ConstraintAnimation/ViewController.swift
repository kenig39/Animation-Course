
import UIKit

class ViewController: UIViewController {

   
    
    let justSimpleFoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "feedback")
        //this  enables autolayout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: ViewController.self, action: #selector(handelAnimate)))
        return imageView
    }()
    
    @objc func handelAnimate(){
      print("trying")
        
//        leftAnchor?.isActive = false
//        rightAnchor?.isActive = false
//        bottonAnchor?.isActive = true
//        rightAnchor?.isActive = true
       
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: {
            
            self.view.layoutIfNeeded()
        })
       
    }
    
    var leftAnchor: NSLayoutConstraint?
    var rightAnchor: NSLayoutConstraint?
    var topAnchor: NSLayoutConstraint?
    var bottonAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(justSimpleFoto)
        
        topAnchor = justSimpleFoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        topAnchor?.isActive = true
        
        leftAnchor = justSimpleFoto.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        leftAnchor?.isActive = true
        
        rightAnchor = justSimpleFoto.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        
        bottonAnchor = justSimpleFoto.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        
        justSimpleFoto.widthAnchor.constraint(equalToConstant: 100).isActive = true
        justSimpleFoto.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }


}

