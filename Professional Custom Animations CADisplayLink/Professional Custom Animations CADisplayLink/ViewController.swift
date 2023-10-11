
import UIKit

class ViewController: UIViewController {

    
    let countingLabel: UILabel = {
        let label = UILabel()
        label.text = "1234"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        
        // create my CADisplayLisk here
        let displayLink = CADisplayLink(target: self, selector: #selector(handelUpDate))
        displayLink.add(to: .main, forMode: .default)
        
    }
    
    var startValue: Double = 900
    let endValue: Double = 12000
    let animationDuration: Double = 3.5
    
    let animationStartDate = Date()
    

    @objc func handelUpDate(){
        let now = Date()
        let elapsTime = now.timeIntervalSince(animationStartDate)
        
        if elapsTime > animationDuration {
            self.countingLabel.text = "\(endValue)"
        } else {
            let persantage = elapsTime / animationDuration
            let value = startValue + persantage * (endValue - startValue)
            self.countingLabel.text = "\(value)"
        }
        
       
       
        
        
        
//        //let seconds = Date().timeIntervalSince1970
//        self.countingLabel.text = "\(startValue)"
//        startValue += 1
//
//        if startValue > endValue {
//            startValue = endValue
//        }
    }
}

