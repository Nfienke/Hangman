//
//  Highscore.swift
//  Hangman
//
//  Created by Nienke Pot on 11-12-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit
    var User = String()//from settings
class Highscore: UIViewController {
    
    var highList: [String] = []
    @IBOutlet weak var tableHighScore: UITableView!
    
    func updateHighScore() {
        currentGame.highscore()
        for i in currentGame.highScoreList.sort(){
             highList.append("\(i) points:       \(User)")
        }
        
        tableHighScore.beginUpdates()
        tableHighScore.insertRowsAtIndexPaths([NSIndexPath(forRow: highList.count-1, inSection: 0)], withRowAnimation: .Automatic)
        tableHighScore.endUpdates()
        NSUserDefaults.standardUserDefaults().setObject(highList, forKey: "highList")
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableHighScore.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        updateHighScore()
        if NSUserDefaults.standardUserDefaults().objectForKey("highList") != nil{
            highList = NSUserDefaults.standardUserDefaults().objectForKey("highList") as! [String]
        }
    }
    
    // Table High score: number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highList.count
    }
    
    // Table High score: content cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableHighScore.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = self.highList[indexPath.row]
        return cell
    }
       


}