//
//  FormattedNumberLabel.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/19.
//

import UIKit

@IBDesignable
class FormattedNumberLabel: UILabel {
    @IBInspectable private(set) var unformattedNumberText: String = "0" {
        didSet {
            self.text = unformattedNumberText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setNumberTextToZero()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setNumberTextToZero()
    }
    
    func appendNumberText(_ value: String) {
        var numberText = self.unformattedNumberText
        
        let signsString = "\(Operator.add.rawValue)\(Operator.subtract.rawValue)."
        let decimalDigitsAndSignsSet = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: signsString))
        
        guard value.rangeOfCharacter(from: decimalDigitsAndSignsSet.inverted) == nil else { return }
        
        numberText.append(value)
        self.unformattedNumberText = numberText
    }
    
    func setNumberTextToZero() {
        unformattedNumberText = "0"
    }
}
