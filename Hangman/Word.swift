//
//  Word.swift
//  Hangman
//
//  Created by Nienke Pot on 18-11-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation

public class Words {
    
    public static let sharedInstance = Words()
    public var words: Array<String>?
    private init() {}
    
    public func loadInstanceWords() {
        if (self.words == nil) {
            self.words = loadText("words")
        }
    }
    
    private func loadText(filename: String) -> Array<String>? {
        do{
            let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "plist")
            return NSArray(contentsOfFile: filePath!) as? [String]
        }
            
        catch{
            return nil
        }
    }
    
   }