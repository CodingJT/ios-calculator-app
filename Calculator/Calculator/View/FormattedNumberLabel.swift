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
    private let decimalPointCharacter = Character(".")
    
    private var isDecimalPointIncluded = false {
        didSet {
            guard isDecimalPointIncluded != oldValue else { return }
            guard isDecimalPointIncluded else {
                self.text = positiveFormattedNumberText
                return
            }
            var newText = positiveFormattedNumberText
            newText.append(decimalPointCharacter)
            self.text = newText
        }
    }
    
    var unformattedNumberText: String {
        var numberText = positiveUnformattedNumberText
        if negativeUnformattedNumberText.isEmpty == false {
            numberText.append(decimalPointCharacter)
            numberText.append(negativeUnformattedNumberText)
        }
        return numberText
    }
    
    private var positiveUnformattedNumberText: String = "" {
        didSet {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            guard let positiveNumber = Double(positiveUnformattedNumberText) else { return }
            guard let formattedPositiveNumberText = formatter.string(from: NSNumber(value: positiveNumber)) else { return }
            positiveFormattedNumberText = formattedPositiveNumberText
        }
    }
    private var negativeUnformattedNumberText: String = "" {
        didSet {
            guard isDecimalPointIncluded else { return }
            var numberText = positiveFormattedNumberText
            numberText.append(decimalPointCharacter)
            numberText.append(negativeUnformattedNumberText)
            self.text = numberText
        }
    }
    private var positiveFormattedNumberText: String = "" {
        didSet {
            var newText = positiveFormattedNumberText
            if isDecimalPointIncluded {
                newText.append(decimalPointCharacter)
                newText.append(negativeUnformattedNumberText)
            }
            self.text = newText
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
        if isDecimalPointIncluded == false, value.contains(decimalPointCharacter) {
            isDecimalPointIncluded = true
        }
        
        let signsString = "\(Operator.add.rawValue)\(Operator.subtract.rawValue)"
        let signsAndDecimalPointSet = CharacterSet(charactersIn: "\(signsString)\(decimalPointCharacter)")
        let decimalDigitsAndSignsWithDecimalPointSet = CharacterSet.decimalDigits.union(signsAndDecimalPointSet)
        
        guard value.rangeOfCharacter(from: decimalDigitsAndSignsWithDecimalPointSet.inverted) == nil else { return }
        
        var newPositiveNumberText = positiveUnformattedNumberText
        var newNegativeNumberText = negativeUnformattedNumberText
        
        if newPositiveNumberText == zeroString && isDecimalPointIncluded == false {
            guard let firstValueCharacter = value.first else { return }
            guard firstValueCharacter != Character(zeroString) else { return }
            guard firstValueCharacter != decimalPointCharacter else { return }
            newPositiveNumberText = ""
        }
        
        if value.last == decimalPointCharacter {
            var newValue = value
            newValue.removeLast()
            newPositiveNumberText.append(newValue)
        } else if isDecimalPointIncluded {
            newNegativeNumberText.append(value)
        } else {
            newPositiveNumberText.append(value)
        }
        
        self.positiveUnformattedNumberText = newPositiveNumberText
        self.negativeUnformattedNumberText = newNegativeNumberText
    }
    
    func setNumberTextToZero() {
        positiveUnformattedNumberText = zeroString
        negativeUnformattedNumberText = ""
        isDecimalPointIncluded = false
    }
}
