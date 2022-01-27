//
//  ViewController.swift
//  SampleClaculator
//
//  Created by Veerabathini,Saitej on 1/27/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var DisplayLabel: UILabel!
    
    var operand1:Double = -1.1
    var operand2:Double = -1.1
    var calcOperator:Character = " "
    var result:Double = 0
    
    @IBAction func Button1(_ sender: UIButton) {
        DisplayLabel.text! += "1"
        if(operand1 == -1.1){
            operand1 = 1
        }
        else{
            operand2 = 1
        }
    }
    
    
    @IBAction func Button2(_ sender: Any) {
        DisplayLabel.text! += "2"
        if(operand2 == -1.1 && operand1 == -1.1){
            operand2 = 2
        }
        else{
            operand1 = 2
        }
    }
    
    
    @IBAction func ButtonPlus(_ sender: Any) {
        DisplayLabel.text! += "+"
        if calcOperator == " "{
            calcOperator = "+"
        }
    }
    
    @IBAction func ButtonEquals(_ sender: Any) {
        DisplayLabel.text! += "="
        
        if calcOperator == "+"{
            result = operand1 + operand2
            DisplayLabel.text! += "\(result)"
        }
        else if calcOperator == "-"{
            result = operand1 - operand2
            DisplayLabel.text! += "\(result)"
        }
    }
    
    @IBAction func ButtonNegatice(_ sender: UIButton) {
        DisplayLabel.text! += "-"
        if calcOperator == " "{
            calcOperator = "-"
        }
    }
}

