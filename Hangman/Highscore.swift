//
//  Highscore.swift
//  Hangman
//
//  Created by Nienke Pot on 11-12-15.
//  Copyright © 2015 Nienke Pot. All rights reserved.
//

import Foundation
import UIKit
 
class Highscore: UIViewController {
    
    var highScoreList = [String]()
    @IBOutlet weak var tableHighScore: UITableView!
    
    func updateHighScore() {
        for i in currentGame.highList.sort(>){
            highScoreList.append(i)
        }
        
        tableHighScore.beginUpdates()
        tableHighScore.insertRowsAtIndexPaths([NSIndexPath(forRow: highScoreList.count-1, inSection: 0)], withRowAnimation: .Automatic)
        tableHighScore.endUpdates()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableHighScore.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        currentGame.highscore()
        updateHighScore()
    }
    
    // Table High score: number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  highScoreList.count
    }
    
    // Table High score: content cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableHighScore.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = self.highScoreList[indexPath.row]
        return cell
    }
}