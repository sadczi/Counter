//
//  ArrayExtension.swift
//  Counter
//
//  Created by Daniel Sadka on 07.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import Foundation


extension Array {
    func save(){
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let path: AnyObject = paths[0]
        let arrPath = path.stringByAppendingString("/array.plist")
        NSKeyedArchiver.archiveRootObject(self as! AnyObject, toFile: arrPath)
    }
}
