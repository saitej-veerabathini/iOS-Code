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
    
    var details : GroceryItem?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = details?.itemName
        itemInfoOutlet.isHidden = true
        var image = details?.itemImage
        itemImageViewOutlet.image = UIImage(named: image!)
        let originalImageFrame = itemImageViewOutlet.frame
        let widthShrink: CGFloat = 30
        let heightShrink: CGFloat = 30
        let newFrame = CGRect(
        x: itemImageViewOutlet.frame.origin.x + widthShrink,
        y: itemImageViewOutlet.frame.origin.y + heightShrink,
        width: itemImageViewOutlet.frame.width - widthShrink,
        height: itemImageViewOutlet.frame.height - heightShrink)
        itemImageViewOutlet.frame = newFrame
        UIView.animate(withDuration: 1.0, delay: 0.7, usingSpringWithDamping: 0.3, initialSpringVelocity: 30.0, animations: {
            self.itemImageViewOutlet.frame = originalImageFrame
        })
    }
    
    @IBAction func showItemInfoAction(_ sender: UIButton) {
        itemInfoOutlet.isHidden = false
        itemInfoOutlet.text = details?.itemInfo
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
