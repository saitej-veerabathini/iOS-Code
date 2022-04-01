//
//  ViewController.swift
//  Veerabathini_WordGuess
//
//  Created by student on 3/23/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordsGuessedLabel: UILabel!
    @IBOutlet weak var wordsMissedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var totalWordsLabel: UILabel!
    @IBOutlet weak var guessLetterField: UITextField!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButtonPressed: UIButton!
    @IBOutlet weak var guessLetterButtonPressed: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var words = [["cricket","A game which has a bat and a ball"],["jupiter","Largest planet"],["car","A four wheel vehicle"],["sun","Nearest star to the Earth"],["spider","An insect with 8 legs"]];
    
    var images =  ["cricket","jupiter","car","sun","spider"]
    
    let maxNumOfWrongGuesses = 10
    var guessesLeft = 11
    var hint = ""
    var word = ""
    var guessCount = 0
    var wordsGuessed = 0
    var wordsMissed = 0
    var letters = ""
    var indexOfWord = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        word = words[indexOfWord][0]
        hint = words[indexOfWord][1]
        hintLabel.text = "HINT: " + hint
        totalWordsLabel.text = "Total number of words in game: \(words.count)"
        wordsRemainingLabel.text = "Total number of words remaining in game:\(words.count)"
        wordFormat()
        guessLetterButtonPressed.isEnabled = false
        playAgainButtonPressed.isHidden = true
    }

    

    
    
    func countUpdation(){
        wordsMissedLabel.text = "Total number of words guessed wrongly: \(wordsMissed)"
        wordsGuessedLabel.text = "Total number of words guessed successfully: \(wordsGuessed)"
        wordsRemainingLabel.text = "Total number of words remaining in game:\(words.count - (wordsGuessed + wordsMissed))"
    }
    
    func resultUpdation(){
        guessLetterField.resignFirstResponder()
        guessLetterField.text = ""
    }
    
    func wordFormat() {
        var revealedWord = ""
        letters += guessLetterField.text!
        letters = letters.lowercased()
        
        for letter in word {
            if letters.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord.uppercased()
    }
    
    func letterGuessed() {
        wordFormat()
        guessCount += 1
        guessesLeft = guessesLeft - 1
        let currentLetterGuessed = guessLetterField.text!
         
        let revealedWord = userGuessLabel.text!
        if guessesLeft == 1 {
            playAgainButtonPressed.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButtonPressed.isEnabled = false
            guessCountLabel.text = "You have used all the available guesses, Please start again"
            wordsMissed += 1
            countUpdation()
            image()
        } else if !revealedWord.contains("_") {
            playAgainButtonPressed.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButtonPressed.isEnabled = false
            guessCountLabel.text = "You won! It took you \(guessCount) attempts to guess the word!"
            wordsGuessed += 1
            countUpdation()
            image()
        } else {
            // Update our guess count
            let guess = ( guessCount == 1 ? "Guess" : "Guesses")
            guessCountLabel.text = "You have made \(guessCount) \(guess)"
        }
        if (wordsGuessed + wordsMissed) == words.count {
            guessCountLabel.text = "Congratulations, You are done, Please start over again"
            image()
        }
    }
    
    
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessLetterField.text?.last {
            guessLetterField.text = "\(letterGuessed)"
            guessLetterButtonPressed.isEnabled = true
        } else {
            
            guessLetterButtonPressed.isEnabled = false
        }
    }
    

    @IBAction func doneKeyPressed(_ sender: UITextField) {
        letterGuessed()
        resultUpdation()
        let letter = guessLetterField.text
        if letter?.isEmpty == true{
            guessLetterButtonPressed.isEnabled = false
        }
        else{
            guessLetterButtonPressed.isEnabled = true
        }
    }
    
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        letterGuessed()
        resultUpdation()
        let letter = guessLetterField.text
        if letter?.isEmpty == true{
            guessLetterButtonPressed.isEnabled = false
        }
        else{
            guessLetterButtonPressed.isEnabled = true
        }
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        imageView.isHidden = true
        indexOfWord += 1
        if indexOfWord == words.count {
            indexOfWord = 0
            wordsGuessed = 0
            wordsMissed = 0
            countUpdation()
        }
        word = words[indexOfWord][0]
        hint = words[indexOfWord][1]
        hintLabel.text = "HINT: " + hint
        playAgainButtonPressed.isHidden = true
        guessLetterField.isEnabled = true
        guessLetterButtonPressed.isEnabled = false
        guessesLeft = maxNumOfWrongGuesses + 1
        letters = ""
        wordFormat()
        guessCountLabel.text = "You have Made Zero Guessess"
        guessCount = 0
    }
    
    func image(){
        if(guessesLeft == 0){
            imageView.isHidden = false
            imageView.image = UIImage(named: images[5])
            let originalImageFrame = imageView.frame
            let widthShrink: CGFloat = 10
            let heightShrink: CGFloat = 10
            let newFrame = CGRect(
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - widthShrink,
            height: imageView.frame.height - heightShrink)
            imageView.frame = newFrame
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0,  animations: {
                            self.imageView.frame = originalImageFrame
                        })
        }
        else{
            imageView.isHidden = false
            imageView.image = UIImage(named: images[indexOfWord])
            let originalImageFrame = imageView.frame
            let widthShrink: CGFloat = 10
            let heightShrink: CGFloat = 10
            let newFrame = CGRect(
            x: imageView.frame.origin.x + widthShrink,
            y: imageView.frame.origin.y + heightShrink,
            width: imageView.frame.width - widthShrink,
            height: imageView.frame.height - heightShrink)
            imageView.frame = newFrame
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0,  animations: {
                            self.imageView.frame = originalImageFrame
                        })
        }
}

}


