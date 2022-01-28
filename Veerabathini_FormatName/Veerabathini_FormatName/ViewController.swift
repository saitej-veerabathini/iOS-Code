//
//  ViewController.swift
//  Veerabathini_FormatName
//
//  Created by Veerabathini,Saitej on 1/27/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    
    @IBOutlet weak var initialsLabel: UILabel!
    
    @IBAction func onClickOfSubmit(_ sender: UIButton) {
        var firstName = firstNameTextField.text!
        var lastName = lastNameTextField.text!
        if(firstNameTextField.hasText && lastNameTextField.hasText)
        {
            var firstInitial = String(firstName.prefix(1)).capitalized
            var lastInitial = String(lastName.prefix(1)).capitalized
            var firstRName = String(firstName.dropFirst())
            var lastRName = String(lastName.dropFirst())
            fullNameLabel.text = "Full Name : " + lastInitial + lastRName + ", " + firstInitial + firstRName
            initialsLabel.text = "Initials : " + lastInitial + firstInitial
        }
        else{
            fullNameLabel.text = "Enter First Name and Last Name"
        }
        
    }
    
    @IBAction func onClickOfReset(_ sender: UIButton) {
        firstNameTextField.text! = ""
        lastNameTextField.text! = ""
        fullNameLabel.text! = ""
        initialsLabel.text! = ""
        let startPosition = firstNameTextField.becomeFirstResponder()
    }
    
    
}

