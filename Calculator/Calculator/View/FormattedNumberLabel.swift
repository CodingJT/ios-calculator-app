//
//  FormattedNumberLabel.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/19.
//

import UIKit

class FormattedNumberLabel: UILabel {
    private var unformattedNumberText: String? = "" {
        didSet {
            self.text = unformattedNumberText
        }
    }
}
