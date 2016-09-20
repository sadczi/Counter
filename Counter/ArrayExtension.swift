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
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        let path: AnyObject = paths[0] as AnyObject
        let arrPath = path.appending("/array.plist")
        NSKeyedArchiver.archiveRootObject(self as AnyObject, toFile: arrPath)
    }
}
