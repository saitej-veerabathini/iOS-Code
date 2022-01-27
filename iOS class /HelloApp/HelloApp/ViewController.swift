//
//  ViewController.swift
//  HelloApp
//
//  Created by Veerabathini,Saitej on 1/20/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textOutlet: UITextField!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func ButtonClick(_ sender: UIButton) {
        //read the text from the text field
        var name = textOutlet.text!
        var count = 0
        var vowels = Set(["A","E","I","U","O","a","e","i","o","u"])
        //change the display label to Hello, name!
        if (textOutlet.hasText)
        {
            if( name.contains("A") || name.contains("E") || name.contains("I") || name.contains("O")  || name.contains("U") || name.contains("a") || name.contains("e") || name.contains("i") || name.contains("o") || name.contains("u")){
                
                displayLabel.text = "Entered text has vowels"
            }
            else{
                displayLabel.text = "Entered text has no vowels"
            }
        }
        else{
            displayLabel.text = "Enter any text"
            displayLabel.textColor = UIColor.gray
        }
        
    }
    

}

