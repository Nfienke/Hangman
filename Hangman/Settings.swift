//
//  Settings.swift
//  Hangman
//
//  Created by Nienke Pot on 29-11-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

class Settings: UIViewController{
    
    @IBOutlet weak var labelUsername: UITextField!
    @IBOutlet weak var labelGameType: UILabel!
    @IBOutlet weak var labelNumletters: UILabel!
    @IBOutlet weak var sliderValueLetters: UISlider!
    @IBOutlet weak var labelNumGuesses: UILabel!
    @IBOutlet weak var sliderValueGuesses: UISlider!
    
    @IBAction func sliderNumGuesses(sender: UISlider) {
        let sliderValueGuesses = Int(sender.value)
        labelNumGuesses.text = "Number of Guesses:" + String(stringInterpolationSegment: sliderValueGuesses)
        currentGame.timesguesses = sliderValueGuesses
        NSUserDefaults.standardUserDefaults().setObject(currentGame.timesguesses, forKey: "timesguesses")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func sliderNumLetters(sender: UISlider) {
        let sliderValueLetters = Int(sender.value)
        labelNumletters.text = "Number of letters:" + String(stringInterpolationSegment: sliderValueLetters)
        lengthWord = sliderValueLetters
        NSUserDefaults.standardUserDefaults().setObject(lengthWord, forKey: "lengthWord")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    //Switcher to chose between the gameplay
    @IBAction func evilgame(sender: UISwitch){
        if sender.on{
            labelGameType.text! = "Evil Hangman"
            typeplay = false
        }
            
        else{
            labelGameType.text! = "Good Hangman"
            typeplay = true
        }
        NSUserDefaults.standardUserDefaults().setObject(typeplay, forKey: "typeplay")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func mainmenu(sender: AnyObject) {
        User = labelUsername.text!
        NSUserDefaults.standardUserDefaults().setObject(User, forKey: "User")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< Updated upstream

         sliderValueLetters.maximumValue = 13 //max length word

       // labelGameType.text = SettingsManager.gametype()
        

       // User = labelUsername.text!

        
//        if NSUserDefaults.standardUserDefaults().objectForKey("User") != nil{
//            User =  NSUserDefaults.standardUserDefaults().objectForKey("User")! as! String
//        }
//        else{
//            User = "Unknown"
//        
//        }
        
//
//          if NSUserDefaults.standardUserDefaults().objectForKey("currentGame") != nil{
//        currentGame = NSUserDefaults.standardUserDefaults().objectForKey("currentGame")!
//    }
//    else{
//        currentGame = Evilplay()
//    }
=======

        sliderValueLetters.maximumValue = 10//max length word
        sliderValueLetters.maximumValue = 26 //max number of guesses
>>>>>>> Stashed changes
    
    }
    
}