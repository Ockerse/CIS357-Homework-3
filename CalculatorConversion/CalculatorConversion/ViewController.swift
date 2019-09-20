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
    var toLength = LengthUnit.Yards
    var fromLength = LengthUnit.Yards
    
    var toVolume = VolumeUnit.Gallons
    var fromVolume = VolumeUnit.Gallons
    
    var getLength = LengthConversionKey.init(toUnits: .Meters, fromUnits: .Yards)
    
    var getVolume = VolumeConversionKey.init(toUnits: .Liters, fromUnits: .Gallons)
    
    var ans = 0.0
    var cons = 0.0
    
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
    
    func currentMode(){
        switch fromLabel.text{
        case "Yards":
            fromLength = .Yards
        case "Meters":
            fromLength = .Meters
        case "Miles":
            fromLength = .Miles
        case "Gallons":
            fromVolume = .Gallons
        case "Liters":
            fromVolume = .Liters
        case "Quarts":
            fromVolume = .Quarts
        default:
            print("There is an error")
        }
        
        switch toLabel.text{
        case "Yards":
            toLength = .Yards
        case "Meters":
            toLength = .Meters
        case "Miles":
            toLength = .Miles
        case "Gallons":
            toVolume = .Gallons
        case "Liters":
            toVolume = .Liters
        case "Quarts":
            toVolume = .Quarts
        default:
            print("There is an error")
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        currentMode()
        if !(fromField.text?.isEmpty)! && !(toField.text?.isEmpty)! {
            print("Error, cannot have both boxes filled")
            print("clear out one of the boxes, thank you!")
        }
        
        else if unit == CalculatorMode.Length && !((fromField.text?.isEmpty)!) {
            if toLength == .Meters {
                getLength = LengthConversionKey.init(toUnits: fromLength, fromUnits: toLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(fromField.text!)!
            }
                
            else if toLength == .Miles {
                getLength = LengthConversionKey.init(toUnits: fromLength, fromUnits: toLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(fromField.text!)!
            }
                
            else if toLength == .Yards {
                getLength = LengthConversionKey.init(toUnits: fromLength, fromUnits: toLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(fromField.text!)!
            }
            
            toField.text = String(ans)
            
        }
            
        else if unit == CalculatorMode.Length && !((toField.text?.isEmpty)!){
            if toLength == .Meters {
                getLength = LengthConversionKey.init(toUnits: fromLength, fromUnits: toLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(toField.text!)!
            }
                
            else if toLength == .Miles {
                getLength = LengthConversionKey.init(toUnits: fromLength, fromUnits: toLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(toField.text!)!
            }
                
            else if toLength == .Yards {
                getLength = LengthConversionKey.init(toUnits: fromLength, fromUnits: toLength)
                cons = lengthConversionTable[getLength]!
                ans = cons * Double(toField.text!)!
            }
            
            fromField.text = String(ans)
        }
            
        else if unit == CalculatorMode.Volume && !((fromField.text?.isEmpty)!) {
            switch fromVolume {
            case .Gallons:
                getVolume = VolumeConversionKey.init(toUnits: toVolume, fromUnits: fromVolume)
                cons = volumeConversionTable[getVolume]!
                
                ans = cons * Double(fromField.text!)!
                
            case .Liters:
                getVolume = VolumeConversionKey.init(toUnits: toVolume, fromUnits: fromVolume)
                cons = volumeConversionTable[getVolume]!
                
                ans = cons * Double(fromField.text!)!
            case .Quarts:
                getVolume = VolumeConversionKey.init(toUnits: toVolume, fromUnits: fromVolume)
                cons = volumeConversionTable[getVolume]!
                
                ans = cons * Double(fromField.text!)!
            }
            
            toField.text = String(ans)
        }
            
        else if unit == CalculatorMode.Volume && !((toField.text?.isEmpty)!) {
            switch toVolume {
            case .Gallons:
                getVolume = VolumeConversionKey.init(toUnits: fromVolume, fromUnits: toVolume)
                cons = volumeConversionTable[getVolume]!
                
                ans = cons * Double(toField.text!)!
                
            case .Liters:
                getVolume = VolumeConversionKey.init(toUnits: fromVolume, fromUnits: toVolume)
                cons = volumeConversionTable[getVolume]!
                
                ans = cons * Double(toField.text!)!
            case .Quarts:
                getVolume = VolumeConversionKey.init(toUnits: fromVolume, fromUnits: toVolume)
                cons = volumeConversionTable[getVolume]!
                
                ans = cons * Double(toField.text!)!
            }
            
            fromField.text = String(ans)
        }
            
        else {
            print("Error")
        
    }
    
 


 }
}
