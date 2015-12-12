//
//  Goodplay.swift
//  Hangman
//
//  Created by Nienke Pot on 23-11-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation

public class Goodplay : Gameplay {
    
    override func checkGuess(tekstField: String) -> Bool {
        if tekstField == ""{
            print("foutje: er is geen letter ingevoerd")
            return false
        }
        
        guess = tekstField.characters.first!
        guessList += [guess]
        if hangWord.characters.contains(guess){
            p += 5
            return true
        }
            
        else {
            p += -1
            timesguesses += -1
            return false
        }
    }
}