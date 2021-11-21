//
//  SavedFormulaListView.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/21.
//

import Foundation
import UIKit

@IBDesignable
class SavedFormulaListView: UIView {
    
    private let verticalStackView = UIStackView()
    
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
    }
    
    private func commonInit() {
        configureView()
    }
    
    func configureView() {
        #if !TARGET_INTERFACE_BUILDER
            self.translatesAutoresizingMaskIntoConstraints = false
        #endif
        configureStackView()
    }
    
    func configureStackView() {
        verticalStackView.alignment = .trailing
        verticalStackView.distribution = .fill
        verticalStackView.spacing = 4
        verticalStackView.axis = .vertical
        
        self.addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
