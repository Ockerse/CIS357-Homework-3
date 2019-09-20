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
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var prefix = "Enter length in "
    var unit = CalculatorMode.Length
    var tolength = LengthUnit.Yards
    var fromlength = LengthUnit.Yards
    
    var tovolume = VolumeUnit.Gallons
    var fromvolume = VolumeUnit.Gallons
    
    
    var mode : CalculatorMode?

    func unitsSelection(from: String, to: String) {
        self.fromLabel!.text = from
        self.fromField!.placeholder = prefix + fromLabel!.text!
        self.toLabel!.text = to
        self.toField!.placeholder = prefix + toLabel!.text!
    }
    
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
    
    func currentMode(){
        switch fromLabel.text{
        case "Yards":
            fromlength = .Yards
        case "Meters":
            fromlength = .Meters
        case "Miles":
            fromlength = .Miles
        case "Gallons":
            fromvolume = .Gallons
        case "Liters":
            fromvolume = .Liters
        case "Quarts":
            fromvolume = .Quarts
        default:
            print("There is an error")
        }
        
        switch toLabel.text{
        case "Yards":
            tolength = .Yards
        case "Meters":
            tolength = .Meters
        case "Miles":
            tolength = .Miles
        case "Gallons":
            tovolume = .Gallons
        case "Liters":
            tovolume = .Liters
        case "Quarts":
            tovolume = .Quarts
        default:
            print("There is an error")
        }
}


}
