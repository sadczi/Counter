//
//  displayHandler.swift
//  Counter
//
//  Created by Daniel Sadka on 04.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

class DisplayHandler: NSObject {
    
    override init(){
        super.init()
    }
    
    func returnImagerForImageView(number:Int) -> UIImage{
        return UIImage(named: "number_\(number)")!
    }
    
    func returnSmallImageForImageView(number:Int) -> UIImage{
        return UIImage(named: "number_\(number)_smal")!
    }
    

    
}
