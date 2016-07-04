//
//  displayHandler.swift
//  Counter
//
//  Created by Daniel Sadka on 04.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

class DisplayHandler: NSObject {
    var numbers: [UIImage] = []
    
    
    
    override init(){
        super.init()
        
        for index in 0...9{
            numbers.append(UIImage(named: "number_\(index)")!)
        }
    }
}
