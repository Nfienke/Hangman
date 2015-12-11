//
//  Highscore.swift
//  Hangman
//
//  Created by Nienke Pot on 11-12-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit
    //var User = String()//from settings
class Highscore: UIViewController {
    
    var userHighScore = ""
    //var highDict =  Dictionary <Int, String>()
    var highScoreList = [String]()
    @IBOutlet weak var tableHighScore: UITableView!
    
    func updateHighScore() {
        //currentGame.highscore()//?
        for i in currentGame.highList{
            highScoreList.append(i)
        }
        
        tableHighScore.beginUpdates()
        tableHighScore.insertRowsAtIndexPaths([NSIndexPath(forRow: highScoreList.count-1, inSection: 0)], withRowAnimation: .Automatic)
        tableHighScore.endUpdates()
//        NSUserDefaults.standardUserDefaults().setObject(highScoreList, forKey: "highList")
//        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableHighScore.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        NSUserDefaults.standardUserDefaults().setObject(highScoreList, forKey: "highScoreList")
//        NSUserDefaults.standardUserDefaults().setObject(highScoreList, forKey: "highScore")
        
//        if NSUserDefaults.standardUserDefaults().objectForKey("highScore") != nil{
//            currentGame.highList = NSUserDefaults.standardUserDefaults().objectForKey("highScore") as! [String]
//        }
//        else{
//            currentGame.highscore()
//        }
//        
//        if NSUserDefaults.standardUserDefaults().objectForKey("highScoreList") != nil{
//            currentGame.highScoreList = NSUserDefaults.standardUserDefaults().objectForKey("highScoreList") as! [Int]
//        }
//        else{
//            currentGame.highscore()
//        }
//


//        if NSUserDefaults.standardUserDefaults().objectForKey("User") != nil{
//            User =  NSUserDefaults.standardUserDefaults().objectForKey("User")! as! String
//        }
//        else{
//            User = "Unknown"
//        
//        }//?

//        if NSUserDefaults.standardUserDefaults().objectForKey("highList") != nil{
//            highScoreList = NSUserDefaults.standardUserDefaults().objectForKey("highList") as! [String]
//        }
        currentGame.highscore()
        updateHighScore()
    }
    
    // Table High score: number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScoreList.count
    }
    
    // Table High score: content cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableHighScore.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = self.highScoreList[indexPath.row]
        return cell
    }
       


}