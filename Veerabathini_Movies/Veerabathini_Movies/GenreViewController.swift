//
//  ViewController.swift
//  Veerabathini_Movies
//
//  Created by student on 4/24/22.
//

import UIKit

class GenreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genresArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = genreTableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
        cell.textLabel?.text = genresArr[indexPath.row].category
        return cell
    }
    

    @IBOutlet weak var genreTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        genreTableView.delegate = self
        genreTableView.dataSource = self
    }

    var genresArr = genres
    //var genre = Genre()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "movieSegue"{
            let destination = segue.destination as! MoviesViewController
            destination.genreDetails = genresArr[(genreTableView.indexPathForSelectedRow?.row)!]
        }
    }

}

