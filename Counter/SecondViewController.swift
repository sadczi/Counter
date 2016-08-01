//
//  SecondViewController.swift
//  Counter
//
//  Created by Daniel Sadka on 02.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var table: UITableView!
    
    var savingLoadingArray = [Save]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        table.dataSource = self
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        savingLoadingArray = appDelegate.savingLoadingArray
        
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        let tmpvalue = self.savingLoadingArray.count
        return tmpvalue
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadSaves()
        print(savingLoadingArray.count)
        table.reloadData()
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! Cell
        cell.leftTextfield.text = "Count = " + String(savingLoadingArray[indexPath.row].score) +  "    \(String(savingLoadingArray[indexPath.row].dateTimeComponents.day))/\(String(savingLoadingArray[indexPath.row].dateTimeComponents.month))/\(String(savingLoadingArray[indexPath.row].dateTimeComponents.year))" + "    \(String(savingLoadingArray[indexPath.row].dateTimeComponents.hour)):\(String(savingLoadingArray[indexPath.row].dateTimeComponents.minute)):\(String(savingLoadingArray[indexPath.row].dateTimeComponents.second))"
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSaves(){
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let path: AnyObject = paths[0]
        let arrPath = path.stringByAppendingString("/array.plist")
        if let tempArr: [Save] = NSKeyedUnarchiver.unarchiveObjectWithFile(arrPath) as? [Save] {
            self.savingLoadingArray = tempArr
        }
    }
}

