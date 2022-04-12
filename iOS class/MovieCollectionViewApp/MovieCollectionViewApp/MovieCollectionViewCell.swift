//
//  MovieCollectionViewCell.swift
//  MovieCollectionViewApp
//
//  Created by Veerabathini,Saitej on 4/12/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    func assignMovies(_ movie: Movie){
        imageViewOutlet.image = movie.image
    }
}
