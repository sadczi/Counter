//
//  SecondViewController.swift
//  Counter
//
//  Created by Daniel Sadka on 02.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITableViewDataSource, UITableViewDelegate , ResetCellDelegate {
    @IBOutlet weak var table: UITableView!
    
    var countingCells:Int = 0
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        table.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadSaves()
        print(appDelegate.savingLoadingArray.count)
        table.reloadData()
    }

    func dataStringDisplayPrepare(input: String) -> String {
        //Making data format strings from numbers example: 1 changes into 01
        let returnString:String
        
        if(Int(input)<10){
            returnString = "0" + input
        }else{
            returnString = input
        }
        
        return returnString
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if(countingCells == appDelegate.self.savingLoadingArray.count){
            let cell = tableView.dequeueReusableCellWithIdentifier("ResetCell", forIndexPath: indexPath) as! ResetCell
                cell.cellDelegate = self
                countingCells = 0
            
                return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! Cell
            var tmpString = "Count = " + String(appDelegate.savingLoadingArray[indexPath.row].score) + "  "
            tmpString += dataStringDisplayPrepare("\(String(appDelegate.savingLoadingArray[indexPath.row].dateTimeComponents.day))") + "/"
            tmpString += dataStringDisplayPrepare("\(String(appDelegate.savingLoadingArray[indexPath.row].dateTimeComponents.month))") + "/"
            tmpString += dataStringDisplayPrepare("\(String(appDelegate.savingLoadingArray[indexPath.row].dateTimeComponents.year))")
            cell.textView.text = tmpString
            cell.textView.userInteractionEnabled = true
            cell.textView.editable = false
            countingCells += 1
            
            return cell
        }
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        if ( (self.appDelegate.savingLoadingArray.count + 1) == 1 ){
            return 0
        }else{
            return self.appDelegate.savingLoadingArray.count + 1
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func resetCellDidSelectButton(cell: ResetCell) {
        table.reloadData()
    }
    
    func loadSaves(){
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let path: AnyObject = paths[0]
        let arrPath = path.stringByAppendingString("/array.plist")
        if let tempArr: [Save] = NSKeyedUnarchiver.unarchiveObjectWithFile(arrPath) as? [Save] {
            self.appDelegate.savingLoadingArray = tempArr
        }
    }
}

