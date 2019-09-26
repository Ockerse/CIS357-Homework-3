//
//  CalculatorConversionTextField.swift
//  CalculatorConversion
//
//  Created by Carson Uecker-Herman on 9/26/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class CalculatorConversionTextField: DecimalMinusTextField {

    override func awakeFromNib() {
        self.tintColor = FOREGROUND_COLOR
        self.backgroundColor = UIColor.clear
        self.borderStyle = .roundedRect
        self.textColor = FOREGROUND_COLOR
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        
        guard let ph = self.placeholder else {
            return
        }
        
        self.attributedPlaceholder =
            NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor : FOREGROUND_COLOR])
    }
   
}
