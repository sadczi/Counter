//
//  FirstViewController.swift
//  Counter
//
//  Created by Daniel Sadka on 02.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {

    var saveingLoadingArray = [Save]()
    
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var unitsImageView: UIImageView!
    @IBOutlet weak var decimalImageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveAction(sender: AnyObject) {
        let save = Save(value: dataHandler.counter)
        dataHandler.reset()
        centerImageView.image = UIImage(named: "number_0")
        label.hidden = true
        centerImageView.hidden = false
        unitsImageView.hidden = true
        decimalImageView.hidden = true
        saveingLoadingArray.append(save)
        saveingLoadingArray.save()
        
    }
   
    let dataHandler: DataHandler = DataHandler()
    let displayHandler: DisplayHandler = DisplayHandler()
   

    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.taped))
        centerImageView.image = UIImage(named: "number_0")
        self.view.addGestureRecognizer(tap)
        label.hidden = true
        saveButton.backgroundColor = UIColor.redColor()
        saveButton.frame.size.width = 300
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        saveingLoadingArray = appDelegate.saveingLoadingArray
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func taped(){
        dataHandler.units = dataHandler.units + 1
        dataHandler.counter = dataHandler.counter + 1
        dataHandler.checkUnits()
        if(dataHandler.checkDecimals() && dataHandler.hundrets > 0){
            label.text = "+\(dataHandler.hundrets)00"
            label.hidden = false
        }
            if(dataHandler.decimals == 0){
                unitsImageView.hidden = true
                decimalImageView.hidden = true
                centerImageView.image = displayHandler.returnImagerForImageView(dataHandler.units)
                centerImageView.hidden = false
            } else{
                centerImageView.hidden = true
                unitsImageView.image = displayHandler.returnSmallImageForImageView(dataHandler.units)
                decimalImageView.image = displayHandler.returnSmallImageForImageView(dataHandler.decimals)
                unitsImageView.hidden = false
                decimalImageView.hidden = false
            }
        print(dataHandler.counter)
    }

}

