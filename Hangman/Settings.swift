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
    
  //
    //let myDefaults = NSUserDefaults.standardUserDefaults()
    var typeplay = Gameplay()
    
    @IBOutlet weak var labelGameType: UILabel!
    
    //Switcher to chose between the gameplay
    @IBAction func evilgame(sender: UISwitch) {
        
        if sender.on{
            labelGameType.text! = "Evil Hangman"
            typeplay = Evilplay()
            
        }
        else{
            labelGameType.text! = "Good Hangman"
            typeplay = Goodplay()
        }
    }
    
    @IBAction func mainmenu(sender: AnyObject) {

    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "seguesettomenu" {
//            if let destinationVC = segue.destinationViewController as? GameplayViewcontroller{
//                    destinationVC.currentGame = typeplay
//                    print(typeplay,"test")
//                }
//        }
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            }
    
}