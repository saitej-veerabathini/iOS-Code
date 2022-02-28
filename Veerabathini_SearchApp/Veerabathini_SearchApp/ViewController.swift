//
//  ViewController.swift
//  Veerabathini_SearchApp
//
//  Created by Veerabathini,Saitej on 2/27/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var arr_img = [["iron-man","captain-america","thor","doctor-strange","balck-panther"],["black-widow","wanda","captain-marvel","wonder-woman","nebula"],["thanos","loki","red-skull","doctor-octopus","ultron"]]

    //var actor_Keywords = 
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func searchButton(_ sender: Any) {
    }
    @IBOutlet weak var resultImage: UIImageView!
    @IBAction func showNextImgBtn(_ sender: Any) {
    }
    @IBAction func showPrevImgBtn(_ sender: Any) {
    }
    @IBOutlet weak var topicInfoText: UITextView!
}

