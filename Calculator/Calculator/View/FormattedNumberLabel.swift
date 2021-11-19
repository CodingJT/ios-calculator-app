//
//  FormattedNumberLabel.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/19.
//

import UIKit

class FormattedNumberLabel: UILabel {
    private(set) var unformattedNumberText: String? = "" {
        didSet {
            self.text = unformattedNumberText
        }
    }
    
    func appendNumberText(_ value: String) {
        var numberText = self.unformattedNumberText ?? "0"
        
        guard numberText.rangeOfCharacter(from: .decimalDigits.inverted) == nil else { return }
        
        numberText.append(value)
        self.unformattedNumberText = numberText
    }
}
