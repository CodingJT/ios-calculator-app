//
//  CurrentInputView.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/19.
//

import UIKit

class CurrentInputView: UIView {
    
    private let operatorTextLabel: UILabel = UILabel()
    private let operandTextLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        configureLabels()
        configureStackView()
    }
    
    private func configureLabels() {
        let additionSymbol = String(Operator.add.rawValue)
        setStyle(for: operatorTextLabel, withText: additionSymbol, textAlignment: .left)
        setStyle(for: operandTextLabel, withText: "1234567890", textAlignment: .right)
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
}
