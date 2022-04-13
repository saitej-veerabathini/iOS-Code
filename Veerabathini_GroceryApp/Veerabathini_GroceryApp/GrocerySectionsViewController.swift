//
//  ViewController.swift
//  Veerabathini_GroceryApp
//
//  Created by student on 4/10/22.
//

import UIKit

class GrocerySectionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = grocerySectionsTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
        cell.textLabel?.text = groceryArr[indexPath.row].section
        return cell
    }
    

    @IBOutlet weak var grocerySectionsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Grocery Sections"
        grocerySectionsTableView.delegate = self
        grocerySectionsTableView.dataSource = self
    }

    class GrocerySections{
        var section : String?
        var items_Array = [GroceryItem]()
    }
    
    struct GroceryItem{
        var itemName = ""
        var itemImage = ""
        var itemInfo = ""
    }
    
    var section = ["Apple Products", "Tesla", "Seven Wonders", "Indian Billionaires", "Shoes"]
    
    var grocery = Grocery()
    var groceryArr = grocerys
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "itemsSegue"{
            let destination = segue.destination as! GroceryItemsViewController
            destination.items = groceryArr[(grocerySectionsTableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    

}

