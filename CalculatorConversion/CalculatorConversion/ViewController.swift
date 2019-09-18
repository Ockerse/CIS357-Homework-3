//
//  ViewController.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/17/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fromField: DecimalMinusTextField!
    @IBOutlet weak var toField: DecimalMinusTextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        toField.text = ""
        fromField.text = ""
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        if self.fromField.text != "" && self.toField.text == ""{
            
        }
        
        else if self.fromField.text == "" && self.toField.text != ""{
            
        }
    }
}


