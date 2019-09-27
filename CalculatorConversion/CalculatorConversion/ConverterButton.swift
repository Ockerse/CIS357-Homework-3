//
//  ConverterButton.swift
//  CalculatorConversion
//
//  Created by Aron Ockerse on 9/27/19.
//  Copyright © 2019 Aron Ockerse. All rights reserved.
//

import UIKit

class ConverterButton: UIButton {
    
    override func awakeFromNib() {
        self.backgroundColor = THEME_COLOR3
        self.tintColor = THEME_COLOR2
        self.layer.borderWidth = 1.0
        self.layer.borderColor = THEME_COLOR3.cgColor
        self.layer.cornerRadius = 5.0
    }
}
