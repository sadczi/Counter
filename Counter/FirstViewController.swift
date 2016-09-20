//
//  FirstViewController.swift
//  Counter
//
//  Created by Daniel Sadka on 02.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var centerImageView: UIImageView = UIImageView()
    var unitsImageView: UIImageView = UIImageView()
    var decimalImageView: UIImageView = UIImageView()
    var label: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveAction(_ sender: AnyObject) {
        let save = Save(value: dataHandler.counter)
        dataHandler.reset()
        centerImageView.image = displayHandler.returnImagerForImageView(0)
        label.isHidden = true
        centerImageView.isHidden = false
        unitsImageView.isHidden = true
        decimalImageView.isHidden = true
        appDelegate.savingLoadingArray.append(save)
        appDelegate.savingLoadingArray.save()
        
    }
   
    let dataHandler: DataHandler = DataHandler()
    let displayHandler: DisplayHandler = DisplayHandler()
   

    
    override func viewDidLoad() {

        super.viewDidLoad()
        label = UILabel(frame: CGRect(x:0, y: 0, width: 100, height: 50))
        view.addSubview(centerImageView)
        view.addSubview(unitsImageView)
        view.addSubview(decimalImageView)
        view.addSubview(label)
        let tap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.taped))
        centerImageView.image = displayHandler.returnImagerForImageView(0)
        self.view.addGestureRecognizer(tap)
        label.isHidden = true
        saveButton.backgroundColor = UIColor.red
        saveButton.frame.size.width = 300
        loadSaves()
        imageViewsSizing()
        view.addSubview(centerImageView)
        view.addSubview(unitsImageView)
        view.addSubview(decimalImageView)
        view.addSubview(label)
        print("center \(view.center)")
        print("Image center \(centerImageView.center)")
        print("height \(UIScreen.main.bounds.size.height)")
        print("width  \(UIScreen.main.bounds.size.width)")
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        UIDevice.current.orientation.isFlat
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            imageViewsSizing(size)
            print("center \(view.center)")
            print("Image center \(centerImageView.center)")
            print("height \(UIScreen.main.bounds.size.height)")
            print("width  \(UIScreen.main.bounds.size.width)")
            print(size)
            
        } else {
            print("Portrait")
            imageViewsSizing(size)
            print("center \(view.center)")
            print("Image center \(centerImageView.center)")
            print("height \(UIScreen.main.bounds.size.height)")
            print("width  \(UIScreen.main.bounds.size.width)")
            print(size)
            
        }
    }
    
    
    func imageViewsSizing(){
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        
        
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
    
    func imageViewsSizing(_ size: CGSize){
        let width = size.width
        let height = size.height
        
        
        if( width > UIScreen.main.bounds.size.width ){
            centerImageView.bounds.size.width = width / 3
        }else{
            centerImageView.bounds.size.width = width / 2
        }
        
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

    func loadSaves(){
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        let path: AnyObject = paths[0] as AnyObject
        let arrPath = path.appending("/array.plist")
        if let tempArr: [Save] = NSKeyedUnarchiver.unarchiveObject(withFile: arrPath) as? [Save] {
            self.appDelegate.savingLoadingArray = tempArr
        }
    }
    
    func taped(){
        dataHandler.units = dataHandler.units + 1
        dataHandler.counter = dataHandler.counter + 1
        dataHandler.checkUnits()
        if(dataHandler.checkDecimals() && dataHandler.hundrets > 0){
            label.text = "+\(dataHandler.hundrets)00"
            label.isHidden = false
        }
            if(dataHandler.decimals == 0){
                unitsImageView.isHidden = true
                decimalImageView.isHidden = true
                centerImageView.image = displayHandler.returnImagerForImageView(dataHandler.units)
                centerImageView.isHidden = false
            } else{
                centerImageView.isHidden = true
                unitsImageView.image = displayHandler.returnSmallImageForImageView(dataHandler.units)
                decimalImageView.image = displayHandler.returnSmallImageForImageView(dataHandler.decimals)
                unitsImageView.isHidden = false
                decimalImageView.isHidden = false
            }
        print(dataHandler.counter)
    }
}


