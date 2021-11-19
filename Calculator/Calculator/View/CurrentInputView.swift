//
//  CurrentInputView.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/19.
//

import UIKit

@IBDesignable
class CurrentInputView: UIView {
    
    private let operatorTextLabel: UILabel = UILabel()
    private let operandTextLabel: UILabel = UILabel()
    
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
    
    var operand: Double? {
        get {
            guard let operandText = operandTextLabel.text else { return nil }
            return Double(operandText)
        }
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
        operandTextLabel.text = "1234567890"
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
        setStyle(for: operandTextLabel, withText: "0" , textAlignment: .right)
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
    
    private func setStyle(for label: UILabel, withText text: String = "", textAlignment: NSTextAlignment) {
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = .white
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        label.text = text
        label.textAlignment = textAlignment
    }
    
    func clearCurrentInput() {
        self.operator = nil
        operandTextLabel.text = "0"
    }
    
    func appendOperandCharacter(_ value: String) {
        // 0일 때 00 입력 무시
        // 0일 때 0 입력 무시
        // 0일 때 1~9 숫자 입력 시 숫자 0에서 해당 숫자로 변경
        var operandText = operandTextLabel.text ?? "0"
        
        // 해당 코드는 임시. 리팩토링 필요
        if operandText == "0" {
            
        } else if operandText == "00" {
            
        } else if value.count == 1 && "0123456789.".contains(value) {
            
        }
        
        operandText.append(value)
        operandTextLabel.text = operandText
    }
}
