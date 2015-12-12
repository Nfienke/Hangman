//
//  Evilplay.swift
//  Hangman
//
//  Created by Nienke Pot on 23-11-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation

public class Evilplay: Gameplay {

    var newWord = String()
    
    
    override func evilWordChooser(tekstField: String) {
        guess = tekstField.characters.first!
        var evilDict = Dictionary <String, [String]>()
        
        for word in wordLengthList{
            var hWord = ""
            var key = ""
            
            for _ in hangWord.characters{
                hWord += "_"
            }
            
            if (word.characters.contains(guess)){
                for i in 0...hWord.characters.count - 1{
                    let index = hWord.startIndex.advancedBy(i)
                    
                    if (word[index] == guess){
                        hWord.removeAtIndex(index)
                        hWord.insert(guess, atIndex: index)
                    }
                }
                
                key = hWord
                if evilDict[key] == nil{
                    evilDict[key] = []
                }
                
                if let _ = evilDict[key]{
                    evilDict[key]?.append(word)
                }
                    
                else{
                    evilDict[key]?.append(word)
                }
            }
                
            // if guess is not in word
            else{
                key = hWord
                if evilDict[key] == nil{
                    evilDict[key] = []
                }
                
                if let _ = evilDict[key]{
                    evilDict[key]?.append(word)
                }
                    
                else{
                    evilDict[key]?.append(word)
                }
            }
        }
    
        //choses the key with the most values.
        var biggestDict = Dictionary <String, [String]>()
        var biggest = [String]()

        for (k,v) in evilDict{
            if v.count > biggestDict.values.first?.count {
                biggestDict = [k:v]
                biggest = v
                newWord = k
            }
        }
        
        wordLengthList = biggest
        randomWord()
        print(newWord) //comment out
    }
    
    override func checkGuess(tekstField: String) -> Bool {
        if tekstField == ""{
            print("foutje: er is geen letter ingevoerd")
            return false
        }
        
        guess = tekstField.characters.first!
        if newWord.containsString(String(guess)){
            p += 10
            return true
        }
            
        else{
            p += -1
            timesguesses += -1
            if timesguesses == 0{
                print("you lose")
            }
            
            return false
        }
    }
}