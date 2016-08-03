//
//  ResetCell.swift
//  Counter
//
//  Created by Daniel Sadka on 03.08.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

class ResetCell: UITableViewCell {

    @IBAction func ResetAction(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.savingLoadingArray.removeAll()
        appDelegate.savingLoadingArray.save()
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
