//
//  SecondViewController.swift
//  Counter
//
//  Created by Daniel Sadka on 02.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class SecondViewController: UIViewController , UITableViewDataSource, UITableViewDelegate , ResetCellDelegate {
    @IBOutlet weak var table: UITableView!
    
    var countingCells:Int = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        table.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSaves()
        print(appDelegate.savingLoadingArray.count)
        table.reloadData()
    }

    func dataStringDisplayPrepare(_ input: String) -> String {
        //Making data format strings from numbers example: 1 changes into 01
        var returnString:String
        
        if(Int(input)<10){
            returnString = "0" + input
        }else{
            returnString = input
        }
        
        if(Int(input)>2000){
            returnString = String(Int(input)! - 2000)
        }
        
        return returnString
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(countingCells == appDelegate.self.savingLoadingArray.count){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResetCell", for: indexPath) as! ResetCell
                cell.cellDelegate = self
                countingCells = 0
            
                return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
            var tmpString = "#" + String(appDelegate.savingLoadingArray[(indexPath as NSIndexPath).row].score) + "  "
            tmpString += dataStringDisplayPrepare("\(String(appDelegate.savingLoadingArray[(indexPath as NSIndexPath).row].dateTimeComponents.day))") + "/"
            tmpString += dataStringDisplayPrepare("\(String(appDelegate.savingLoadingArray[(indexPath as NSIndexPath).row].dateTimeComponents.month))") + "/"
            tmpString += dataStringDisplayPrepare("\(String(appDelegate.savingLoadingArray[(indexPath as NSIndexPath).row].dateTimeComponents.year))") + " "
             tmpString += dataStringDisplayPrepare("\(String(appDelegate.savingLoadingArray[(indexPath as NSIndexPath).row].dateTimeComponents.hour))") + ":"
             tmpString += dataStringDisplayPrepare("\(String(appDelegate.savingLoadingArray[(indexPath as NSIndexPath).row].dateTimeComponents.minute))") + ":"
             tmpString += dataStringDisplayPrepare("\(String(appDelegate.savingLoadingArray[(indexPath as NSIndexPath).row].dateTimeComponents.second))")
            cell.textView.text = tmpString
            cell.textView.isUserInteractionEnabled = true
            cell.textView.isEditable = false
            countingCells += 1
            
            return cell
        }
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        if ( (self.appDelegate.savingLoadingArray.count + 1) == 1 ){
            return 0
        }else{
            return self.appDelegate.savingLoadingArray.count + 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func resetCellDidSelectButton(_ cell: ResetCell) {
        table.reloadData()
    }
    
    func loadSaves(){
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        let path: AnyObject = paths[0] as AnyObject
        let arrPath = path.appending("/array.plist")
        if let tempArr: [Save] = NSKeyedUnarchiver.unarchiveObject(withFile: arrPath) as? [Save] {
            self.appDelegate.savingLoadingArray = tempArr
        }
    }
}

