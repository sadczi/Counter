//
//  ResetCell.swift
//  Counter
//
//  Created by Daniel Sadka on 03.08.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit

protocol ResetCellDelegate:class {
    func resetCellDidSelectButton(_ cell: ResetCell)
}

class ResetCell: UITableViewCell , UITableViewDelegate {

    var cellDelegate: ResetCellDelegate?
    
    @IBAction func ResetAction(_ sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.savingLoadingArray.removeAll()
        appDelegate.savingLoadingArray.save()
        selectedAction()
        print("reloaded")
    }

    func selectedAction() {
        self.cellDelegate?.resetCellDidSelectButton(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
