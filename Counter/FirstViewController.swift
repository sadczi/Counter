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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerImageView.image = UIImage(named: "number_0_changed")
       // unitsImageView.image = UIImage(named: "number_0_changed")
       // decimalImageView.image = UIImage(named: "number_0_changed")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

