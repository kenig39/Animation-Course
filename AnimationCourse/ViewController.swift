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
        
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Shimmer"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 1)
        darkTextLabel.font = UIFont.systemFont(ofSize: 80)
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        darkTextLabel.textAlignment = .center
        
        view.addSubview(darkTextLabel)
        
        
        
        
        let shintTextLabel = UILabel()
        shintTextLabel.text = "Shimmer"
        shintTextLabel.textColor = UIColor(white: 1, alpha: 1)
        shintTextLabel.font = UIFont.systemFont(ofSize: 80)
        shintTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        shintTextLabel.textAlignment = .center
        
        view.addSubview(darkTextLabel)
        
        //pretty easy if you know thwe code to draw a gradient
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1]
        gradient.frame = view.frame
        
        view.layer.addSublayer(gradient)
        
        
        
    }
}
