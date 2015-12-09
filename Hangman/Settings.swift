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
    
    var User = ""
    
    class var sharedInstance: Settings {
        struct Static {
            static let instance: Settings = Settings()
        }
        return Static.instance
    }
    
    
    @IBOutlet weak var labelUsername: UITextField!
    
   
    
    //let myDefaults = NSUserDefaults.standardUserDefaults()
    var typeplay =  NSUserDefaults.standardUserDefaults().objectForKey("typeplay")!
    
    @IBOutlet weak var labelGameType: UILabel!
    
    //Switcher to chose between the gameplay
    @IBAction func evilgame(sender: UISwitch){
        //
//        if sender.on{
//            labelGameType.text! = SettingsManager.gametype()
//            
//        }
//        else{
//            labelGameType.text! = "Good Hangman"
//            SettingsManager.Gametype()
//        }
        
        //SettingsManager.Gametype()
//        NSUserDefaults.standardUserDefaults().setObject(typeplay, forKey: "typeplay")
//        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func mainmenu(sender: AnyObject) {
        //NSUserDefaults.standardUserDefaults().synchronize()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelGameType.text = SettingsManager.gametype()
        

       // User = labelUsername.text!
        
//        if NSUserDefaults.standardUserDefaults().objectForKey("typeplay") != nil{
//            typeplay = NSUserDefaults.standardUserDefaults().objectForKey("typeplay")!
//        }
//        else{
//            typeplay = "Evilplay()"
//        }
        
    }
    
}