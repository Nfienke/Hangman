//
//  GameEndViewController.swift
//  Hangman
//
//  Created by Nienke Pot on 08-12-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit

class GameEndViewController: UIViewController {

    var outcome = ""
    @IBOutlet weak var labelGameOutcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelGameOutcome.text = outcome
        
    }
}