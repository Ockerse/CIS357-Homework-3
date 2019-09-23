//
//  PickerViewController.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/18/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func settingsChanged(fromUnits: LengthUnit, toUnits: LengthUnit)
    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit)
}

class SettingsViewController: UIViewController {

   var mode : CalculatorMode?
       var save : Bool?
       
       @IBOutlet weak var fromPicker: UIPickerView!
       @IBOutlet weak var fromSelect: UIButton!
       @IBOutlet weak var toSelect: UIButton!
       var selection : String = "Yards"
       var selection2 : String = "Meters"
       var whichLabel : Bool?
       var pickerData : [String] = [String]()
       var delegate: SettingsViewControllerDelegate?
       
       override func viewDidLoad() {
           super.viewDidLoad()

            self.pickerData = ["Yards", "Meters", "Miles"]
        self.fromPicker.delegate = self
        self.fromPicker.dataSource = self
    
           
           if mode == .Volume {
               selection = "Gallons"
               selection2 = "Liters"
               
               fromSelect.setTitle("Gallons", for: UIControl.State.normal)
               toSelect.setTitle("Liters", for: UIControl.State.normal)
           }
           
         
       }
       
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
       
       @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
           self.save = false
           self.dismiss(animated: true, completion: nil)
       }
       
       @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
           self.save = true
           self.viewWillDisappear(true)
           self.dismiss(animated: true, completion: nil)
       }
       @IBAction func fromSelectButtonPressed(_ sender: Any) {
           self.fromPicker.isHidden = false
           whichLabel = true
           if mode! == .Length {
               self.pickerData = ["Yards", "Meters", "Miles"]
               
           }
               
           else {
               self.pickerData = ["Gallons", "Liters", "Quarts"]
               
           }
           self.fromPicker.delegate = (self as! UIPickerViewDelegate)
           self.fromPicker.dataSource = (self as! UIPickerViewDataSource)
       }
       
       @IBAction func toSelectButtonPressed(_ sender: Any) {
       }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate {
            d.settingsChanged(fromUnits: LengthUnit.Meters, toUnits: LengthUnit.Yards)
        }
    }
    
    
    
}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selection = self.pickerData[row]
    }
}
