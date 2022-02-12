//
//  ViewController.swift
//  Veerabathini_Calculator
//
//  Created by Veerabathini,Saitej on 2/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
var number:Int = 0
    var operandClicked:Bool = false
    
    func number(_ input:Int){
        if(operandClicked == false){
            number = (number*10) + input
        }
        
    }
    
    func label(_ input:String){
        displayLabel.text! += input
    }

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func btnAC(_ sender: UIButton) {
    }
    
    @IBAction func btnC(_ sender: UIButton) {
    }
    
    @IBAction func btnSignChange(_ sender: UIButton) {
    }
    
    @IBAction func btnDivide(_ sender: UIButton) {
        operandClicked = true
        displayLabel.text! = ""
    }
    
    @IBAction func btn7(_ sender: UIButton) {
        label("7")
        number(7)
        
    }
    
    @IBAction func btn8(_ sender: UIButton) {
        label("8")
        number(8)
    }
    
    @IBAction func btn9(_ sender: UIButton) {
        label("9")
        number(9)
    }
    
    @IBAction func btnMul(_ sender: UIButton) {
        operandClicked = true
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        label("4")
        number(4)
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        label("5")
        number(5)
    }
    
    @IBAction func btn6(_ sender: UIButton) {
        label("6")
        number(6)
    }
    
    @IBAction func btnSub(_ sender: UIButton) {
        operandClicked = true
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        label("1")
        number(1)
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        label("2")
        number(2)
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        label("3")
        number(3)
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        operandClicked = true
    }
    
    @IBAction func btn0(_ sender: UIButton) {
        label("0")
        number(0)
    }
    
    @IBAction func btnDecimal(_ sender: UIButton) {
    }
    
    @IBAction func btnMod(_ sender: UIButton) {
    }
    
    @IBAction func btnEquals(_ sender: UIButton) {
    }
    
}

