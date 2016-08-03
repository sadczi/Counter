//
//  Cell.swift
//  Counter
//
//  Created by Daniel Sadka on 28.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
