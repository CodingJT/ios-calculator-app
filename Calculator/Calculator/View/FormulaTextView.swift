//
//  CurrentInputView.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/19.
//

import UIKit

@IBDesignable
class FormulaTextView: UIView {
    
    private let operatorTextLabel: UILabel = UILabel()
    private let operandTextLabel: FormattedNumberLabel = FormattedNumberLabel()
    
    var `operator`: Operator? {
        get {
            guard let operatorText = operatorTextLabel.text, operatorText.count == 1 else { return nil }
            let operatorCharacter = Character(operatorText)
            return Operator(rawValue: operatorCharacter)
        }
        set {
            guard let operatorCharacter = newValue?.rawValue else {
                operatorTextLabel.text = nil
                return
            }
            let operatorText = String(operatorCharacter)
            operatorTextLabel.text = operatorText
        }
    }
    
    var operandText: String? {
        get {
            return operandTextLabel.unformattedNumberText
        }
        set {
            operandTextLabel.setNumberTextToZero()
            guard let numberText = newValue else { return }
            operandTextLabel.appendNumberText(numberText)
        }
    }
    
    var formulaText: String? {
        guard let operatorText = operatorTextLabel.text, operatorText.count == 1 else { return nil }
        let operandText = operandTextLabel.unformattedNumberText
        return operatorText + operandText
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureView()
        self.operator = .add
        operandTextLabel.appendNumberText("1234567890")
    }
    
    func commonInit() {
        configureView()
    }
    
    private func configureView() {
        #if !TARGET_INTERFACE_BUILDER
            self.translatesAutoresizingMaskIntoConstraints = false
        #endif
        self.backgroundColor = .clear
        configureLabels()
        configureStackView()
    }
    
    private func configureLabels() {
        operatorTextLabel.setContentHuggingPriority(.required, for: .horizontal)
        operatorTextLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        setStyle(for: operatorTextLabel, textAlignment: .left)
        setStyle(for: operandTextLabel, textAlignment: .right)
    }
    
    private func configureStackView() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        stackView.addArrangedSubview(operatorTextLabel)
        stackView.addArrangedSubview(operandTextLabel)
    }
    
    private func setStyle(for label: UILabel, textAlignment: NSTextAlignment) {
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = .white
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        label.textAlignment = textAlignment
    }
    
    func clearCurrentInput() {
        self.operator = nil
        operandTextLabel.setNumberTextToZero()
    }
    
    func appendOperandCharacter(_ value: String) {
        operandTextLabel.appendNumberText(value)
    }
}
