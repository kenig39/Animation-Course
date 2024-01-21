//
//  ViewController.swift
//  AnimationCourse
//
//  Created by Alexander on 11.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.15)
        
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Shimmer"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 1)
        darkTextLabel.font = UIFont.systemFont(ofSize: 80)
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        darkTextLabel.textAlignment = .center
        
        
        let shintTextLabel = UILabel()
        shintTextLabel.text = "Shimmer"
        shintTextLabel.textColor = .white
        shintTextLabel.font = UIFont.systemFont(ofSize: 80)
        shintTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        shintTextLabel.textAlignment = .center
        
        view.addSubview(shintTextLabel)
        
        //pretty easy if you know the code to draw a gradient
        let gradient = CAGradientLayer()
        
        // if you are follows along make sure yo use cgcolor
        gradient.colors = [UIColor.white.cgColor, UIColor.clear.cgColor , UIColor.black.cgColor]
        gradient.locations = [0, 0.5 , 1]
        gradient.frame = shintTextLabel.frame
        let ange = 45 * CGFloat.pi / 180
        gradient.transform = CATransform3DMakeRotation( ange, 0, 0, 1)
        
        shintTextLabel.layer.mask = gradient
        
        //animation
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        
        gradient.add(animation, forKey: "doet matter key")
        
        
        
    }
}
