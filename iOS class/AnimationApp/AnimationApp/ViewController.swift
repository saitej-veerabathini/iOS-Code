//
//  ViewController.swift
//  AnimationApp
//
//  Created by Veerabathini,Saitej on 3/17/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Move all the components outside of the view.
        imageOutlet.frame.origin.x = view.frame.maxX;
        imageOutlet.image = UIImage(named: "hello")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Move all the components outside of the view.
        imageOutlet.frame.origin.x = view.frame.maxX;
        happyOutlet.frame.origin.x = view.frame.maxX;
        sadOutlet.frame.origin.x = view.frame.maxX;
        angryOutlet.frame.origin.x = view.frame.maxX;
        shakeMeOutlet.frame.origin.x = view.frame.maxX;

        
    }

    @IBOutlet weak var imageOutlet: UIImageView!
   
    
    @IBAction func happyButton(_ sender: Any) {
        animateImage("happy")
    }
    
    @IBAction func sadButton(_ sender: Any) {
        animateImage("sad")
    }
    
    
    @IBAction func angryButton(_ sender: Any) {
        animateImage("angry")
    }
    
    @IBAction func shakeMeButton(_ sender: Any) {
        
        var w = imageOutlet.frame.width
        w += 40
        var h = imageOutlet.frame.height
        h += 40
        var x = imageOutlet.frame.origin.x - 20
        var y = imageOutlet.frame.origin.y - 20
        
        var largerFrame = CGRect(x: x, y: y, width: w, height: h)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, animations: {
            self.imageOutlet.frame = largerFrame
        })
    }
    
    @IBAction func showButton(_ sender: Any) {
        UIView.animate(withDuration: 1,animations: {
            self.imageOutlet.center.x = self.view.center.x;
            self.happyOutlet.center.x = self.view.center.x;
            self.sadOutlet.center.x = self.view.center.x;
            self.angryOutlet.center.x = self.view.center.x;
            self.shakeMeOutlet.center.x = self.view.center.x;
            self.showOutlet.isEnabled = false;
        })
        
        
    }
    
    func animateImage(_ imageName: String){
        //image opaque
        UIView.animate(withDuration: 1, animations: {
            self.imageOutlet.alpha = 0; //image opaque

        })
        
        UIView.animate(withDuration: 1, delay: 0.2, animations: {
            self.imageOutlet.alpha = 1; //image transparent
            self.imageOutlet.image = UIImage(named: imageName)

        })        
    }
    
    @IBOutlet weak var happyOutlet: UIButton!
    
    @IBOutlet weak var sadOutlet: UIButton!
    
    @IBOutlet weak var angryOutlet: UIButton!
    
    @IBOutlet weak var shakeMeOutlet: UIButton!
    
    @IBOutlet weak var showOutlet: UIButton!
    
}

