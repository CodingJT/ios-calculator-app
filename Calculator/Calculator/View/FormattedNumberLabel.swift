//
//  FormattedNumberLabel.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/19.
//

import UIKit

@IBDesignable
class FormattedNumberLabel: UILabel {
    private let zeroString = String(Int.zero)
    private var isDecimalPointIncluded = false
    
    @IBInspectable private(set) var unformattedNumberText: String = "" {
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
        let decimalPointCharacter = Character(".")
        
        let signsString = "\(Operator.add.rawValue)\(Operator.subtract.rawValue)"
        let signsAndDecimalPointSet = CharacterSet(charactersIn: "\(signsString)\(decimalPointCharacter)")
        let decimalDigitsAndSignsWithDecimalPointSet = CharacterSet.decimalDigits.union(signsAndDecimalPointSet)
        
        guard value.rangeOfCharacter(from: decimalDigitsAndSignsWithDecimalPointSet.inverted) == nil else { return }
        
        if numberText == zeroString {
            guard let firstValueCharacter = value.first else { return }
            guard firstValueCharacter != Character(zeroString) else { return }
            if firstValueCharacter != decimalPointCharacter {
                numberText = ""
            }
        }
        
        if value.contains(decimalPointCharacter) {
            guard isDecimalPointIncluded == false else { return }
            isDecimalPointIncluded = true
        }
        
        numberText.append(value)
        self.unformattedNumberText = numberText
    }
    
    func setNumberTextToZero() {
        unformattedNumberText = zeroString
        isDecimalPointIncluded = false
    }
}
