//
//  ViewController.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/17/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SettingsViewControllerDelegate {
    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit) {
        self.fromLabel.text = "\(fromUnits)"
        self.toLabel.text = "\(toUnits)"
    }
    
    func settingsChanged(fromUnits: LengthUnit, toUnits: LengthUnit){
        self.fromLabel.text = "\(fromUnits)"
        self.toLabel.text = "\(toUnits)"
    }

    
    @IBOutlet weak var fromField: DecimalMinusTextField!
    @IBOutlet weak var toField: DecimalMinusTextField!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
   
    var currentMode: CalculatorMode = .Length

    func unitsSelection(from: String, to: String, mode: String) {
        self.fromLabel!.text = from
        self.fromField!.placeholder = "Enter " + mode + " " + fromLabel!.text!
        self.toLabel!.text = to
        self.toField!.placeholder = "Enter " + mode + " " + toLabel!.text!
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
    
    @IBAction func modePressed(_ sender: UIButton) {
        
        if (currentMode == .Length){
            currentMode = .Volume
            titleLabel.text = "Volume Conversion Calculator"
            fromLabel.text = "Liters"
            toLabel.text = "Gallons"
            unitsSelection(from: "Liters", to: "Gallons", mode: "volume")
        }
        else {
            currentMode = .Length
            titleLabel.text = "Length Conversion Calculator"
            fromLabel.text = "Yards"
            toLabel.text = "Meters"
            unitsSelection(from: "Yards", to: "Meters", mode: "length" )
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let convertFrom:Double? = Double(fromField.text!)
        let convertTo:Double? = Double(toField.text!)
        
        switch currentMode {
         
        case .Length:
            let funit:LengthUnit? = LengthUnit(rawValue: fromLabel.text!)
            let tunit:LengthUnit? = LengthUnit(rawValue: toLabel.text!)
            
            if fromField.text != "" && toField.text == "" {
                let convKey = LengthConversionKey(toUnits: funit!, fromUnits: tunit!)
                let toVal = convertFrom! * lengthConversionTable[convKey]!
                
                toField.text = "\(toVal)"
            
            }
                 
            else if fromField.text == "" && toField.text != "" {
                     let convKey = LengthConversionKey(toUnits: tunit!, fromUnits: funit!)
                                   let toVal = convertTo! * lengthConversionTable[convKey]!
                                   
                                   fromField.text = "\(toVal)"
            }
            
        case .Volume:
            let funit:VolumeUnit? = VolumeUnit(rawValue: fromLabel.text!)
            let tunit:VolumeUnit? = VolumeUnit(rawValue: toLabel.text!)
                    
                    if fromField.text != "" && toField.text == "" {
                        let convKey = VolumeConversionKey(toUnits: funit!, fromUnits: tunit!)
                        let toVal = convertFrom! * volumeConversionTable[convKey]!
                        
                        toField.text = "\(toVal)"
                    
                    }
                         
                    else if fromField.text == "" && toField.text != ""{
                             let convKey = VolumeConversionKey(toUnits: tunit!, fromUnits: funit!)
                                           let toVal = convertTo! * volumeConversionTable[convKey]!
                                           
                                           fromField.text = "\(toVal)"
                    }
        default:
            print("")
        }
        
    
        
    }
    /*
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
*/
    
    
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSettings" {
            if let dest = segue.destination as? SettingsViewController {
                dest.delegate = self
            }
    }
    }
    
}
