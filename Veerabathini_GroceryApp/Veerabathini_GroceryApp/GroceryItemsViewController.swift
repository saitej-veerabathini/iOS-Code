//
//  GrocerItemsViewController.swift
//  Veerabathini_GroceryApp
//
//  Created by student on 4/10/22.
//

import UIKit

class GroceryItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groceryItemsTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = sections!.items_Array[indexPath.row].itemName
        return cell
    }
    
    var groceryItemStruct = GroceryItem()
    var groceryArray = grocerySections
    


    @IBOutlet weak var groceryItemsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        groceryItemsTableView.delegate = self
        groceryItemsTableView.dataSource = self
        self.title = sections?.section
    }
    
    var sections : GrocerySections?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "itemInfoSegue"{
            let destination = segue.destination as! ItemInfoViewController
            destination.items = sections!.items_Array[(groceryItemsTableView.indexPathForSelectedRow?.row)!]
        }
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
