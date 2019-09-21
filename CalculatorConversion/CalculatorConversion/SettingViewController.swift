//
//  SettingViewController.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/20/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var save : Bool?
    @IBOutlet weak var fromUnit: UIButton!
    @IBOutlet weak var toUnit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
