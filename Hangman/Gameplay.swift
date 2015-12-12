//
//  Gameplay.swift
//  Hangman
//
//  Created by Nienke Pot on 30-11-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation
    var lengthWord = Int() //from settings
    var User = String()//from settings

public class Gameplay {
    var highList = [String]()
    var win = false
    var hangWord = ""
    var randIndex : Int = 0
    var guess:Character = " "
    var guessList: [Character] = []
    var allGuesses : String = ""
    var wordLengthList: [String] = []
    var p = Int() //points for guessing wrong or right letter
    var point = 0
    var timesguesses = Int()
    
  
    func lengthOfWord() {
        var dictWords : Dictionary <String, Int> = [User: point]
        
        for word in Words.sharedInstance.words!{
            dictWords[word] = word.characters.count
        }
        
        for (k,v) in dictWords{
            if v == lengthWord{
                wordLengthList.append(k.lowercaseString)
            }
        }
    }
    
    func randomWord() {
        randIndex = Int(arc4random_uniform(UInt32(wordLengthList.count)))
        hangWord = wordLengthList[randIndex]
        print(hangWord) //comment out
        NSUserDefaults.standardUserDefaults().setObject(hangWord, forKey: "hangword")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func evilWordChooser(tekstField: String) {
    }
    
    func checkGuess(tekstfield: String) -> Bool {
        return true
    }
    
    func showWord(guess: Character, tekstField: String) -> String {
        var newWord = tekstField
        
        for i in 0...newWord.characters.count - 1{
            let index = newWord.startIndex.advancedBy(i)
            
            if (hangWord[index] == guess){
                newWord.removeAtIndex(index)
                newWord.insert(guess, atIndex: index)
                
                if (newWord == hangWord){
                    win = true
                }
            }
        }
        
        return newWord
    }
    
    func showAllGuesses()-> String {
        allGuesses = String(guessList)
        return allGuesses
    }
    
    func points()->Int {
        point = point + p
        return point
    }
    
    func highscore() {
        highList.append("\(User) \(point) points \(timesguesses) guesses left \(hangWord)")
        NSUserDefaults.standardUserDefaults().setObject(highList, forKey: "highScore")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func timeguessed()  {
    
        if NSUserDefaults.standardUserDefaults().objectForKey("timesguesses") != nil{
            timesguesses = NSUserDefaults.standardUserDefaults().objectForKey("timesguesses") as! Int
        }
            
        else{
<<<<<<< Updated upstream
            highScoreList = [0,0,0,0,0]
        }

        for i in highList.sort() {
            self.highScoreList = highScoreList.sort()
            self.highList = highList.sort()
            //print(highList)
            let index = highScoreList.startIndex.advancedBy(i)
            if point > i {
                highScoreList.removeAtIndex(index)
                highScoreList.insert(point, atIndex: index)
                highList.removeAtIndex(index)
                highList.insert("\(point)\(User)", atIndex: index)
                break
            }
            else{
                break
            }
=======
            timesguesses = 7
>>>>>>> Stashed changes
        }
    }
}