//
//  Gameplay.swift
//  Hangman
//
//  Created by Nienke Pot on 30-11-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation
    var lengthWord : Int = 4 //from settings
    var username = String()


public class Gameplay {
    
    var highScoreList = [Int]()
   // var highScoreDict = Dictionary <String, Int> ()
    var win = false
    var hangWord = ""
    var randIndex : Int = 0
    var guess:Character = " "
    var guessList: [Character] = []
    var allGuesses : String = ""
    var wordLengthList: [String] = []
    
    var p = Int() //points for guessing wrong or right letter
    var point = 0
    var timesguesses = 7 //from setting
    
    
    func lengthOfWord() {
        var dictWords : Dictionary <String, Int> = [:]
        
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
        print(hangWord)//comment out
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
                    //print("you win")//remove
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
        highScoreList = [0,0,0,0,0,0,0,0,0,0]
        //let punt = 0
        for i in highScoreList.sort() {
            self.highScoreList = highScoreList.sort()
            let index = highScoreList.startIndex.advancedBy(i)
            if point > i {
                highScoreList.removeAtIndex(index)
                highScoreList.insert(point, atIndex: index)
                break
            }
            else{
                break
            }
        }
    }
    
    }