//
//  FirstViewController.swift
//  Counter
//
//  Created by Daniel Sadka on 02.07.2016.
//  Copyright © 2016 Daniel Sadka. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {


    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var unitsImageView: UIImageView!
    @IBOutlet weak var decimalImageView: UIImageView!
    
    let dataHandler: DataHandler = DataHandler()
    let displayHandler: DisplayHandler = DisplayHandler()
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.taped))
        centerImageView.image = UIImage(named: "number_0")
        self.view.addGestureRecognizer(tap)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func taped(){
        dataHandler.units.successor()
        counter.successor()
        if(dataHandler.checkUnits()){
            
        }
        if(dataHandler.checkDecimals()){
            
        }
    }
    


}

