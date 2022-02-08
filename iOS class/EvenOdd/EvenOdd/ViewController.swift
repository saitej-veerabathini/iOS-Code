//
//  ViewController.swift
//  EvenOdd
//
//  Created by Veerabathini,Saitej on 2/8/22.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var textNymber: UITextField!
    
    @IBAction func buttonSubmit(_ sender: UIButton) {
        let input = Int (textNymber.text!)
        if(input!%2 == 0){
            resultLabel.text = "\(input!) is even number"
        }
        else{
            resultLabel.text = "\(input!) is odd number"
        }
        
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
}

