//
//  Saves.swift
//  Counter
//
//  Created by Daniel Sadka on 06.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

class Save: NSObject {
    let score: Int
    var dateTimeComponents: AnyObject = 0 as AnyObject
    
    init(value:Int){
        self.score = value
        super.init()
        // get the current date and time
        let currentDateTime = Date()
        
        // get the user's calendar
        let userCalendar = Calendar.current
        
        // choose which date and time components are needed
        let requestedComponents: NSCalendar.Unit = [
            NSCalendar.Unit.year,
            NSCalendar.Unit.month,
            NSCalendar.Unit.day,
            NSCalendar.Unit.hour,
            NSCalendar.Unit.minute,
            NSCalendar.Unit.second
        ]
        
        // get the components
        dateTimeComponents = (userCalendar as NSCalendar).components(requestedComponents, from: currentDateTime) as AnyObject
        
    }
    
    func encodeWithCoder(_ aCoder: NSCoder!) {
        aCoder.encode(score, forKey:"score")
        aCoder.encode(dateTimeComponents, forKey:"dateTimeComponents")
    }
    
    init (coder aDecoder: NSCoder!) {
        
        self.score = aDecoder.decodeInteger(forKey: "score") as! Int
        self.dateTimeComponents = aDecoder.decodeObject(forKey: "dateTimeComponents")! as AnyObject
    }



}
