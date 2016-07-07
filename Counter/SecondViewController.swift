//
//  SecondViewController.swift
//  Counter
//
//  Created by Daniel Sadka on 02.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var saveingLoadingArray = [Save]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        saveingLoadingArray = appDelegate.saveingLoadingArray
        loadSaves()
        print("yolo")
        let tmp = saveingLoadingArray.popLast()
        print(tmp!.score)
        print(tmp?.dateTimeComponents.day)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSaves(){
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let path: AnyObject = paths[0]
        let arrPath = path.stringByAppendingString("/array.plist")
        if let tempArr: [Save] = NSKeyedUnarchiver.unarchiveObjectWithFile(arrPath) as! [Save] {
            self.saveingLoadingArray = tempArr
        }
    }

}

