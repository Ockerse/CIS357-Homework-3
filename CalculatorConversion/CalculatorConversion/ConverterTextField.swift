//
//  ConverterTextField.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/27/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit


import UIKit

class ConverterTextField: UITextField {
    
    override func awakeFromNib() {
        
        self.tintColor = THEME_COLOR3
        self.layer.borderWidth = 1.0
        self.layer.borderColor = THEME_COLOR3.cgColor
        self.layer.cornerRadius = 5.0
        
        self.textColor = THEME_COLOR3
        self.backgroundColor = UIColor.clear
        self.borderStyle = .roundedRect
        
        guard let ph = self.placeholder  else {
            return
        }
        
        self.attributedPlaceholder =
            NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor :
                THEME_COLOR3])
    }
}
