//
//  ItemInfoViewController.swift
//  Veerabathini_GroceryApp
//
//  Created by student on 4/10/22.
//

import UIKit

class ItemInfoViewController: UIViewController {

    @IBOutlet weak var itemImageViewOutlet: UIImageView!
    
    @IBOutlet weak var itemInfoOutlet: UITextView!
    
    var items : GroceryItem?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = items?.itemName
        itemInfoOutlet.isHidden = true
        let image = items?.itemImage
        itemImageViewOutlet.image = UIImage(named: image!)
        UIView.animate(withDuration: 1.0, delay: 0.2,  animations: {
            self.itemImageViewOutlet.alpha = 0;
        })
        UIView.animate(withDuration: 1, delay: 0.2, animations: {
            self.itemImageViewOutlet.alpha = 1; //image transparent

        })
    }
    
    
    @IBAction func showItemInfoAction(_ sender: UIButton) {
        itemInfoOutlet.isHidden = false
        itemInfoOutlet.text = items?.itemInfo
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
