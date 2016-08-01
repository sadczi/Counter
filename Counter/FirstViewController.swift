//
//  FirstViewController.swift
//  Counter
//
//  Created by Daniel Sadka on 02.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {

    var savingLoadingArray = [Save]()
    
    var centerImageView: UIImageView = UIImageView()
    var unitsImageView: UIImageView = UIImageView()
    var decimalImageView: UIImageView = UIImageView()
    var label: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveAction(sender: AnyObject) {
        let save = Save(value: dataHandler.counter)
        dataHandler.reset()
        centerImageView.image = UIImage(named: "number_0")
        label.hidden = true
        centerImageView.hidden = false
        unitsImageView.hidden = true
        decimalImageView.hidden = true
        savingLoadingArray.append(save)
        savingLoadingArray.save()
        
    }
   
    let dataHandler: DataHandler = DataHandler()
    let displayHandler: DisplayHandler = DisplayHandler()
   

    
    override func viewDidLoad() {

        super.viewDidLoad()
        view.addSubview(centerImageView)
        view.addSubview(unitsImageView)
        view.addSubview(decimalImageView)
        label = UILabel(frame: CGRect(x:0, y: 0, width: 100, height: 50))
        view.addSubview(label)
        let tap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.taped))
        centerImageView.image = displayHandler.returnImagerForImageView(0)
        self.view.addGestureRecognizer(tap)
        label.hidden = true
        saveButton.backgroundColor = UIColor.redColor()
        saveButton.frame.size.width = 300
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        savingLoadingArray = appDelegate.savingLoadingArray
        imageViewsSizing()
        print("center \(view.center)")
        print("Image center \(centerImageView.center)")
        print("height \(UIScreen.mainScreen().bounds.size.height)")
        print("width  \(UIScreen.mainScreen().bounds.size.width)")
        
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        UIDevice.currentDevice().orientation.isFlat
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            print("Landscape")
            imageViewsSizing(size)
            print("center \(view.center)")
            print("Image center \(centerImageView.center)")
            print("height \(UIScreen.mainScreen().bounds.size.height)")
            print("width  \(UIScreen.mainScreen().bounds.size.width)")
            print(size)
            
        } else {
            print("Portrait")
            imageViewsSizing(size)
            print("center \(view.center)")
            print("Image center \(centerImageView.center)")
            print("height \(UIScreen.mainScreen().bounds.size.height)")
            print("width  \(UIScreen.mainScreen().bounds.size.width)")
            print(size)
            
        }
    }
    
    
    func imageViewsSizing(){
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        
        
        centerImageView.bounds.size.width = width / 2
        centerImageView.bounds.size.height = height / 3
        
        unitsImageView.bounds.size.width = width / 3
        unitsImageView.bounds.size.height = height / 3
        
        decimalImageView.bounds.size.width = width / 3
        decimalImageView.bounds.size.height = height / 3
        
        centerImageView.center = self.view.center
        unitsImageView.center = self.view.center
        decimalImageView.center = self.view.center
        
        
        unitsImageView.center.x += unitsImageView.bounds.width / 2
        decimalImageView.center.x -= decimalImageView.bounds.width / 2
        
        centerImageView.center.y -= centerImageView.bounds.height / 2
        unitsImageView.center.y -= unitsImageView.bounds.height / 2
        decimalImageView.center.y -= decimalImageView.bounds.height / 2
        
        label.center = centerImageView.center
        label.center.y += centerImageView.bounds.height * 3/4
        label.center.x += label.bounds.width / 4
        
    }
    
    func imageViewsSizing(size: CGSize){
        let width = size.width
        let height = size.height
        
        
        
        centerImageView.bounds.size.width = width / 2
        centerImageView.bounds.size.height = height / 3
        
        unitsImageView.bounds.size.width = width / 3
        unitsImageView.bounds.size.height = height / 3
        
        decimalImageView.bounds.size.width = width / 3
        decimalImageView.bounds.size.height = height / 3
        
        centerImageView.center = CGPoint(x: size.width / 2 , y: size.height / 2)
        unitsImageView.center = CGPoint(x: size.width / 2 , y: size.height / 2)
        decimalImageView.center = CGPoint(x: size.width / 2 , y: size.height / 2)
        
        
        unitsImageView.center.x += unitsImageView.bounds.width / 2
        decimalImageView.center.x -= decimalImageView.bounds.width / 2
        
        centerImageView.center.y -= centerImageView.bounds.height / 2
        unitsImageView.center.y -= unitsImageView.bounds.height / 2
        decimalImageView.center.y -= decimalImageView.bounds.height / 2
        
        label.center = centerImageView.center
        label.center.y += centerImageView.bounds.height * 3/4
        label.center.x += label.bounds.width / 4
        
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


