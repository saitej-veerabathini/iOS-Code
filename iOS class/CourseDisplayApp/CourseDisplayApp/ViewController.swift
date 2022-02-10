//
//  ViewController.swift
//  CourseDisplayApp
//
//  Created by Veerabathini,Saitej on 2/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Load the details (image, num, title and sem) of the first (0th element) course
        
        updateUI(imageNumber);
        
        //Previous button is disabled
        
        previousButton.isEnabled = false;
        
    }
    @IBAction func previousButtonClicked(_ sender: Any) {
        //UI should be updated with the previous course details
        imageNumber -= 1
        updateUI(imageNumber)
        
        //next button should be enabled
        nextButton.isEnabled = true
        
        //once reaching the start of courses array , previousButton should be diabled.
        if(imageNumber == 0){
            previousButton.isEnabled = false
        }
    }
    @IBAction func nextButtonClicked(_ sender: Any) {
        //UI should be updated with the next course details
        imageNumber += 1
        updateUI(imageNumber)
        
        //previous button should be enabled
        previousButton.isEnabled = true
        
        //once reaching the end of courses array , nextButton should be diabled.
        if(imageNumber == courses.count-1){
            nextButton.isEnabled = false
        }
        
    }
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    @IBOutlet weak var crsNum: UILabel!
    @IBOutlet weak var crsTitle: UILabel!
    @IBOutlet weak var crsSemester: UILabel!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let courses = [["img01","44555","Network Security","Fall 2022"],
                   ["img02","44643","iOS","Spring 2022"],
                   ["img03","44656","Streaming Data","Summer 2022"]]
    
    var imageNumber = 0
    
    func updateUI(_ imageNumber:Int){
        imageViewOutlet.image = UIImage(named: courses[imageNumber][0])
        crsNum.text = courses[imageNumber][1]
        crsTitle.text = courses[imageNumber][2]
        crsSemester.text = courses[imageNumber][3]
    }
}

