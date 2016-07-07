//
//  Saves.swift
//  Counter
//
//  Created by Daniel Sadka on 06.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

class Save: NSObject {
    let score: Int
    var dateTimeComponents: AnyObject = 0
    
    init(value:Int){
        self.score = value
        super.init()
        // get the current date and time
        let currentDateTime = NSDate()
        
        // get the user's calendar
        let userCalendar = NSCalendar.currentCalendar()
        
        // choose which date and time components are needed
        let requestedComponents: NSCalendarUnit = [
            NSCalendarUnit.Year,
            NSCalendarUnit.Month,
            NSCalendarUnit.Day,
            NSCalendarUnit.Hour,
            NSCalendarUnit.Minute,
            NSCalendarUnit.Second
        ]
        
        // get the components
        dateTimeComponents = userCalendar.components(requestedComponents, fromDate: currentDateTime)
        
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(score, forKey:"score")
        aCoder.encodeObject(dateTimeComponents, forKey:"dateTimeComponents")
    }
    
    init (coder aDecoder: NSCoder!) {
        self.score = aDecoder.decodeObjectForKey("score") as! Int
        self.dateTimeComponents = aDecoder.decodeObjectForKey("dateTimeComponents")! as AnyObject
    }



}
