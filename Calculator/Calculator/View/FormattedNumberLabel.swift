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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setNumberTextToZero()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setNumberTextToZero()
    }
    
    func appendNumberText(_ value: String) {
        var numberText = self.unformattedNumberText ?? "0"
        
        guard numberText.rangeOfCharacter(from: .decimalDigits.inverted) == nil else { return }
        
        numberText.append(value)
        self.unformattedNumberText = numberText
    }
    
    func setNumberTextToZero() {
        unformattedNumberText = "0"
    }
}
