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
    
    @IBAction func sliderNumLetters(sender: UISlider) {
        let sliderValueLetters = Int(sender.value)
        labelNumletters.text = "Number of letters:" + String(stringInterpolationSegment: sliderValueLetters)
        lengthWord = sliderValueLetters
         NSUserDefaults.standardUserDefaults().setObject(lengthWord, forKey: "lengthWord")
    }
    //Switcher to chose between the gameplay
    @IBAction func evilgame(sender: UISwitch){
        if sender.on{
            labelGameType.text! = "Evil Hangman"
            typeplay = true
        }
            
        else{
            labelGameType.text! = "Good Hangman"
            typeplay = false
        }
        NSUserDefaults.standardUserDefaults().setObject(typeplay, forKey: "typeplay")
        //NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func mainmenu(sender: AnyObject) {
        User = labelUsername.text!
        NSUserDefaults.standardUserDefaults().setObject(User, forKey: "User")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         sliderValueLetters.maximumValue = 13 //max length word
        
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
    
    }
    
}