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
    
    @IBAction func sliderNumLetters(sender: AnyObject) {
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
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //username
        

      //        if NSUserDefaults.standardUserDefaults().objectForKey("currentGame") != nil{
//            currentGame = NSUserDefaults.standardUserDefaults().objectForKey("currentGame")!
//        }
//        else{
//            currentGame = Evilplay()
//        }
        
    }
    
}