//
//  ViewController.swift
//  Veerabathini_GroceryApp
//
//  Created by student on 4/10/22.
//

import UIKit

class GrocerySectionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = grocerySectionsTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
        cell.textLabel?.text = groceryArray[indexPath.row].section
        return cell
    }
    

    @IBOutlet weak var grocerySectionsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        grocerySectionsTableView.delegate = self
        grocerySectionsTableView.dataSource = self
    }
    
    var groceryStruct = GrocerySections()
    var groceryArray = grocerySections
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "itemsSegue"{
            let destination = segue.destination as! GroceryItemsViewController
            destination.sections = groceryArray[(grocerySectionsTableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    

}

