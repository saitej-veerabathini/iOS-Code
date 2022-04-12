//
//  ViewController.swift
//  MovieCollectionViewApp
//
//  Created by Veerabathini,Saitej on 4/12/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //create a cell and type cast with MovieCollectionViewCell
        let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        
        //assign movies to cell
        cell.assignMovies(movies[indexPath.row])

        
        //return cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        titleOutlet.text = "Movie: \(movies[indexPath.row].title)"
        yearReleasedOutlet.text = "Released: \(movies[indexPath.row].releasedYear)"
        ratingOutlet.text = "Rating: \(movies[indexPath.row].movieRating)"
        revenueOutlet.text = "Box Office: \(movies[indexPath.row].boxOffice)"
    }

    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBOutlet weak var yearReleasedOutlet: UILabel!
    
    @IBOutlet weak var ratingOutlet: UILabel!
    
    @IBOutlet weak var revenueOutlet: UILabel!
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionViewOutlet.delegate = self
        collectionViewOutlet.dataSource = self
    }


}

