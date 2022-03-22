//
//  ViewController.swift
//  DiscountAppMultiContoller
//
//  Created by Veerabathini,Saitej on 3/22/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var priceAfterDiscount = 0.0
    
    @IBOutlet weak var amountOutlet: UITextField!
    
    @IBOutlet weak var discountOutlet: UITextField!
    
    @IBAction func calcDiscountButtonClicked(_ sender: UIButton) {
        var amount = Double(amountOutlet.text!)
        var discountRate = Double(discountOutlet.text!)
        priceAfterDiscount = amount! - (amount!*(discountRate!/100))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "ResultSegue"{
            //make ResultViewController
            var destination = segue.destination as! ResultViewController
            destination.amount = amountOutlet.text!
            destination.discount = discountOutlet.text!
            destination.priceAfterDiscount = String(priceAfterDiscount)
        }
    }
}

