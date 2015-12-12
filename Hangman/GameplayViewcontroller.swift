//
//  Hangman.swift
//  Hangman
//
//  Created by Nienke Pot on 18-11-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

    var typeplay = Bool()
    var currentGame = Gameplay() //from settings

class GameplayViewcontroller: UIViewController {
    
    @IBOutlet weak var tekstField: UITextField!
    @IBOutlet weak var labelHangWord: UILabel!
    @IBOutlet weak var labelWrongGuesses: UILabel!
    @IBOutlet weak var labelPoints: UILabel!
    @IBOutlet weak var labelGuessesLeft: UILabel!
    
    var gameOutcome = String()
    
    //sends guess of the user.
    @IBAction func guessButton(sender: AnyObject) {
        currentGame.evilWordChooser(tekstField.text!)
        
        if (currentGame.checkGuess(tekstField.text!)) {
            labelHangWord.text! = currentGame.showWord(tekstField.text![tekstField.text!.startIndex], tekstField: labelHangWord.text!)
            NSUserDefaults.standardUserDefaults().setObject(currentGame.showWord(tekstField.text![tekstField.text!.startIndex], tekstField: labelHangWord.text!), forKey: "showWord")
        }
        
        labelWrongGuesses.text! = currentGame.showAllGuesses()
        labelGuessesLeft.text! = "\(currentGame.timesguesses) guesses left"
        labelPoints.text = "\(currentGame.points()), points"
        
        // if there are no guesses left, and the player loses.
        if currentGame.timesguesses <= 0{
            gameOutcome = "lose"
            performSegueWithIdentifier("segueEndGame", sender: self)
        }
        
        if currentGame.win == true{
            //gameOutcome = "win"
            performSegueWithIdentifier("segueEndGame", sender: self)
        }
        
        NSUserDefaults.standardUserDefaults().setInteger(currentGame.timesguesses, forKey: "timesguesses")
        NSUserDefaults.standardUserDefaults().setInteger(currentGame.point, forKey: "points")
        NSUserDefaults.standardUserDefaults().setObject(currentGame.showAllGuesses(), forKey: "guesses")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

        
    // sends info when user loses or wins and resets the stored values.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueEndGame" {
            if let destinationVC = segue.destinationViewController as? GameEndViewController{
                if gameOutcome == "lose"{
                    currentGame.highscore()
                    destinationVC.outcome = "You lose"
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("guesses")
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("showWord")
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("points")
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("timesguesses")
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("hangword")
                }
                    
                else{
                    currentGame.highscore()
                    destinationVC.outcome = "You win"
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("guesses")
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("showWord")
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("points")
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("timesguesses")
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("hangword")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //typeplay
        if NSUserDefaults.standardUserDefaults().objectForKey("typeplay") != nil{
            typeplay = (NSUserDefaults.standardUserDefaults().objectForKey("typeplay")) as! Bool
        }
            
        else{
            typeplay = false
        }

        //typeplay: choses evil or good .
        if typeplay == false{
            currentGame = Evilplay()
        }
        else{
            currentGame = Goodplay()
        }

        print(currentGame)// mag eruit
        
        
        // user
        if NSUserDefaults.standardUserDefaults().objectForKey("User") != nil{
            User = "\(NSUserDefaults.standardUserDefaults().objectForKey("User")!)"
        }
            
        else{
            User = "Unknown"
        }
        
        // shows the guesses that are left
        if NSUserDefaults.standardUserDefaults().objectForKey("timesguesses") != nil{
            labelGuessesLeft.text = "\(NSUserDefaults.standardUserDefaults().objectForKey("timesguesses")!) guesses left"
        }
            
        else{
            labelGuessesLeft.text! = "\(currentGame.timesguesses) guesses left"
        }
        currentGame.timeguessed()
        labelGuessesLeft.text! = "\(currentGame.timesguesses ) guesses left"
        
        //length of the word
        if NSUserDefaults.standardUserDefaults().objectForKey("lengthWord") != nil{
            lengthWord = NSUserDefaults.standardUserDefaults().objectForKey("lengthWord") as! Int
        }
            
        else{
            lengthWord =  4
        }

        //Hangword
        if NSUserDefaults.standardUserDefaults().objectForKey("hangword") != nil{
            currentGame.hangWord = "\(NSUserDefaults.standardUserDefaults().objectForKey("hangword")!)"
        }
        else{
            currentGame.lengthOfWord()
            currentGame.randomWord()
        }
        print(currentGame.hangWord) // mageruit
        
        var hiddenWord: String = ""
        for _ in currentGame.hangWord.characters {
            hiddenWord += "_"
        }
        
        // shows the word that needs to be guessed.
        if NSUserDefaults.standardUserDefaults().objectForKey("showWord") != nil{
            labelHangWord.text! = "\(NSUserDefaults.standardUserDefaults().objectForKey("showWord")!)"
        }
        else{
            labelHangWord.text! = hiddenWord
        }
        
        // shows the guesses of the user.
        if NSUserDefaults.standardUserDefaults().objectForKey("guesses") != nil{
            labelWrongGuesses.text! = "\(NSUserDefaults.standardUserDefaults().objectForKey("guesses")!)"
        }
            
        else{
            labelWrongGuesses.text! = currentGame.showAllGuesses()
        }
                
        // shows the number of points
        if NSUserDefaults.standardUserDefaults().objectForKey("points") != nil{
            labelPoints.text = "\(NSUserDefaults.standardUserDefaults().objectForKey("points")!) points"
        }
            
        else{
            labelPoints.text = "\(currentGame.points()) points"
        }
        
        
        //highscore
        if NSUserDefaults.standardUserDefaults().objectForKey("highScore") != nil{
            currentGame.highList = NSUserDefaults.standardUserDefaults().objectForKey("highScore") as! [String]
        }
            
        else{
            currentGame.highList = [String]()
        }


    }
}