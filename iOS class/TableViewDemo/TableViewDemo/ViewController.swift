//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Veerabathini,Saitej on 3/29/22.
//

import UIKit

class Product{
    var productName : String?
    var productCategory : String?
    
    init(productName: String, productCategory: String){
        self.productName = productName;
        self.productCategory = productCategory;
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //return the cell with data
        //create cells dynamically
        var cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        //Assign the data to the cell
        cell.textLabel?.text = productArray[indexPath.row].productName
        //return cell
        return cell
    }
    
    var productArray = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        let product1 = Product(productName: "MacBookAir", productCategory: "Laptop")
        productArray.append(product1)
        
        let product2 = Product(productName: "iPhone", productCategory: "Mobile Phone")
        productArray.append(product2)
        
        let product3 = Product(productName: "Airpods", productCategory: "Ear Phones")
        productArray.append(product3)
        
        let product4 = Product(productName: "iWatch", productCategory: "Watch")
        productArray.append(product4)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "detailsSegue"{
            let destination = segue.destination as!DetailViewController
            
            destination.product = productArray[(tableViewOutlet.indexPathForSelectedRow?.row)!]
        }
    }

    @IBOutlet weak var tableViewOutlet: UITableView!
    
}

